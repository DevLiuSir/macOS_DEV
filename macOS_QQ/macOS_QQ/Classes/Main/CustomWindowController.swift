//
//  CustomWindowController.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/16.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class CustomWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        configUI()
        
        // 设置dock图标: 指定为一个NSImage对象
        NSApp.applicationIconImage = NSImage(named: "AppIcon")
        
        //监听窗口变化
        NotificationCenter.default.addObserver(self, selector: #selector(configUI), name: NSWindow.didResizeNotification, object: nil)
        
    }
    // 析构器(销毁)
    deinit {
        print("custom controller be dealloc ")
    }
}

// MARK: - custom method
extension CustomWindowController {
    
    /// 配置UI
    @objc private func configUI() {
        
        // 获取窗口的主视图
        guard let themeView = window?.contentView?.superview else { return }
        
        // 根据主视图获取titleBar view
        guard let titleBarView = themeView.subviews.last else { return }
        
        // 标题视图是否自动调整其子视图的大小
        titleBarView.autoresizesSubviews = true
        
//        // 根据层级结构获取到标题栏视图
//        let titleView = (themeView?.subviews.count)! > 1 ? themeView?.subviews[1] : nil
//        // 标题视图是否自动调整其子视图的大小。
//        titleView?.autoresizesSubviews = true
    }
}

// MARK: - NSWindowDelegate
extension CustomWindowController : NSWindowDelegate {
    
    func windowDidResize(_ notification: Notification) {
        configUI()
    }
}
