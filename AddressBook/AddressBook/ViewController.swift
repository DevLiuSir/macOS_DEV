//
//  ViewController.swift
//  AddressBook
//
//  Created by Liu Chuan on 2017/7/3.
//  Copyright © 2017年 LC. All rights reserved.
//

import Cocoa

/// 开
private let on = 1
/// 关
private let off = 0


class ViewController: NSViewController {
    
    // MARK: - 控件属性
    /// 姓名
    @IBOutlet weak var nameTextField: NSTextField!
    /// 年龄
    @IBOutlet weak var ageCombox: NSComboBox!
    /// 男
    @IBOutlet weak var manBtn: NSButton!
    /// 女
    @IBOutlet weak var womanBtn: NSButton!
    /// 结果
    @IBOutlet var resultTextView: NSTextView!
    
    /// 数字
    private var number = 1
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 文本输入框 取消第一响应者
        nameTextField.resignFirstResponder()
        
        addCombox()
    }
    
    /// 提交个人信息按钮点击事件
    ///
    /// - Parameter sender: 任意对象
    @IBAction func submitPersonalMessages(_ sender: NSButton) {
        // 结果
        resultTextView.string = "姓名:" + nameTextField.stringValue + "\n"
            + "年龄:" + ageCombox.stringValue + "\n"
            + "性别:" + configSexValue()
        
    }
    
    /// 按钮(男)点击事件
    ///
    /// - Parameter sender: 按钮对象
    @IBAction func chooseMan(_ sender: NSButton) {
        if womanBtn.state.rawValue == on {
            womanBtn.state = NSControl.StateValue(rawValue: off)
        }
        manBtn.state = NSControl.StateValue(rawValue: on)
    }
    
    /// 按钮(女)点击事件
    ///
    /// - Parameter sender: 按钮对象
    @IBAction func chooseWoman(_ sender: NSButton) {
        if manBtn.state.rawValue == on {
            manBtn.state = NSControl.StateValue(rawValue: off)
        }
        womanBtn.state = NSControl.StateValue(rawValue: on)
    }
    
    /// 配置性别
    ///
    /// - Returns: 性别
    private func configSexValue() -> String {
        
        if manBtn.state.rawValue == on {
            return "男"
        } else {
            return "女"
        }
    }
    
    /// 添加年龄
    private func addCombox() {
        for _ in 1..<50 {
            ageCombox.addItem(withObjectValue: number)
            number += 1
        }
        ageCombox.selectItem(at: 27)
        ageCombox.scrollItemAtIndexToTop(27)
    }
    
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
}
