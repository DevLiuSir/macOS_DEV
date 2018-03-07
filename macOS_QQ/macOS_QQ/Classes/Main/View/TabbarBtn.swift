//
//  TabbarBtn.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/15.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa


/*
     一个NSTrackingArea对象定义一个鼠标的运动敏感区域.
    当鼠标进入（Enter）/移动（moves）/离开（exits）这个敏感区域，Application Kit 发送 mouse-tracking, mouse-moved, and cursor-update 消息。
 
 */


class TabbarBtn: NSButton {
    
//    /// 是否被选中
//    var selected: Bool = false {
//        didSet {
//            setSelected(selected)
//        }
//    }
    
    /// 按下状态的图片名称
    var downImageName = ""
    
    /// 默认状态的图片名称
    var normalImageName = ""

    // 绘制界面
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // 响应鼠标移入移出事件
        let area = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeInKeyWindow], owner: self, userInfo: nil)
        addTrackingArea(area)
        
        
//         let trackArea = NSTrackingArea(rect: bounds, options: [.activeInActiveApp,.mouseEnteredAndExited], owner: self, userInfo: nil)
//        addTrackingArea(trackArea)
        
    }
    
    
//    override func mouseEntered(with event: NSEvent) {
//        image = NSImage(named: downImageName)
//    }
    
    
    
//    /// 防止按钮按下后移出区域,按钮状态不改变的情况.
//    ///
//    /// - Parameter event: 触摸事件
//    override func mouseExited(with event: NSEvent) {
//        if !selected {
//            image = NSImage(named: normalImageName)
//        }
//
////        if selected {
////            image = NSImage(named: downImageName)
////        }else {
////            image = NSImage(named: normalImageName)
////        }
//
//    }
    
    
//    override func mouseExited(with event: NSEvent) {
//        if isHoverNormal {
//            image = NSImage(named: NSImage.Name("icon-enter-normal"))
//        }else{
//            image = normalImage
//        }
//    }
    
    
    
    
  /*
    
    /// 鼠标按下时候调用
    ///
    /// - Parameter event: 触摸事件
    override func mouseDown(with event: NSEvent) {
        
        image = NSImage(named: downImageName)
        
        // 这句必须加上，防止按钮的点击事件被覆盖
        super.mouseDown(with: event)
    }
    
    
    /// 鼠标抬起的时候调用
    ///
    /// - Parameter event: 触摸事件
    override func mouseUp(with event: NSEvent) {
        if !selected {
            image = NSImage(named: normalImageName)
            super.mouseUp(with: event)
        }
    }
    
    
    /// 切换选中状态
    ///
    /// - Parameter selected: 是否选中
    func setSelected(_ selected: Bool) {
        self.selected = selected
        image = self.selected ? NSImage(named: downImageName) : NSImage(named: normalImageName)
    }
*/
}
