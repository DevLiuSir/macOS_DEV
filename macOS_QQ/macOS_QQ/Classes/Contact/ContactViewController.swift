//
//  ContactViewController.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/23.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

class ContactViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 操作layer属性必须加，否则无效
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.orange.cgColor
    }
    
}


extension ContactViewController {
    
    /// 提供一个通过 Storyboard 快速获取控制器的类方法
    ///
    /// - Returns: ContactViewController
    class func controller() -> ContactViewController{
        let vc = NSStoryboard(name: "Contact", bundle: nil).instantiateInitialController() as! ContactViewController
        return vc
    }
    
}
