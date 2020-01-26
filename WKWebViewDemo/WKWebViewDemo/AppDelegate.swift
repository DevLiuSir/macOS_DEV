//
//  AppDelegate.swift
//  WKWebViewDemo
//
//  Created by Liu Chuan on 2020/10/15.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var tabService: TabService!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        replaceTabServiceWithInitialWindow()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    /// Fallback for the menu bar action when all windows are closed.
    @IBAction func newWindowForTab(_ sender: Any?) {

        if let existingWindow = tabService.mainWindow {
            tabService.createTab(newWindowController: WindowController.createController(), inWindow: existingWindow, ordered: .above)
        }else {
            replaceTabServiceWithInitialWindow()
        }
        
    }

    private func replaceTabServiceWithInitialWindow() {
        let windowController = WindowController.createController()
        windowController.showWindow(self)
        tabService = TabService(initialWindowController: windowController)
    }
    

}

