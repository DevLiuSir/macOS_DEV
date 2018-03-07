//
//  CustomWindow.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/16.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

/// 自定义Window
class CustomWindow: NSWindow {
    

    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        
        // 设置点击背景时能够移动窗口
        isMovableByWindowBackground = true
        // 设置标题栏是否透明
        titlebarAppearsTransparent = true
        // 隐藏窗口标题
        titleVisibility = NSWindow.TitleVisibility.hidden
    }
    
    override var contentView: NSView? {
        get {
            return super.contentView
        }
        set(contentView) {
            super.contentView = contentView
        }
    }

    // 不加上此代码window将无法响应
    override var canBecomeKey: Bool {
        return true
    }
    
    override var canBecomeMain: Bool {
        return true
    }
    
}
