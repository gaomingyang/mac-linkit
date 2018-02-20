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
    }
    
    @objc func quit() {
        NSApplication.shared.terminate(self)
    }
    
    @objc func clickIco(){
        print("ico clicked")
    }

}

