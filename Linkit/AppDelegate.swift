//
//  AppDelegate.swift
//  Linkit
//
//  Created by Sunshine on 20/02/2018.
//  Copyright © 2018 Sunshine. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var item : NSStatusItem? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        item?.image = NSImage(named:NSImage.Name(rawValue: "ico"))
        //item?.title = "Link It!"
        //item?.action = #selector(AppDelegate.clickIco)  //点击顶部图标执行的方法，如果有菜单，则显示菜单，不会执行。
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Link It!", action: #selector(AppDelegate.linkIt), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.quit), keyEquivalent: ""))
        //keyEquivalent留空，不显示快捷键。若小写字母，cmd+字母,若大写字母，则是cmd+shift+字母
        item?.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func linkIt() {
        print("link it")
        
        if let items = NSPasteboard.general.pasteboardItems {
            for item in items {
                for type in item.types{
                    if type == NSPasteboard.PasteboardType("public.utf8-plain-text") {
                        if let url = item.string(forType: type) {
                            print(url)
                            
                            var actualUrl = ""
                            
                            if url.hasPrefix("http://") || url.hasPrefix("https://") {
                                actualUrl = url
                            } else {
                                //actualUrl = "http://" + url
                                actualUrl = "http://\(url)"
                            }
                            
                            NSPasteboard.general.clearContents()  //清空剪贴板
                            NSPasteboard.general.setString("<a href=\"\(actualUrl)\">\(url)</a>", forType: NSPasteboard.PasteboardType("public.html")) //对于支持富文本的，取html内容时，获得带链接的html内容
                            NSPasteboard.general.setString(url, forType: NSPasteboard.PasteboardType("public.utf8-plain-text")) //对于不支持富文本的，只能从剪贴板获得utf8字符串
                        }

                    }

                }
            }
        }
        
        //printPasteboard()
    }
    
    func printPasteboard() {
        if let items = NSPasteboard.general.pasteboardItems {
            for item in items {
                for type in item.types{
                    // print(type)
                    print("Type: \(type)")
                    print("String: \(String(describing: item.string(forType: type)))")
                }
            }
        }
    }
    
    @objc func quit() {
        NSApplication.shared.terminate(self)
    }
    
    @objc func clickIco(){
        print("ico clicked")
    }

}

