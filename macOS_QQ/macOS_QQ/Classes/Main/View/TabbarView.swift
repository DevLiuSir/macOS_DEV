//
//  TabbarView.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/15.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa



//private let MessageKey = "message"
//private let ContactKey = "contact"
//private let MoreKey = "more"


class TabbarView: NSView {
    
//    /// 记录上一个被选中的按钮
//    private lazy var lastSelectBtn: TabbarBtn = TabbarBtn()
//
//    /// 选项控制器字典
//    private lazy var controllerDict = [String : NSViewController]()
    
    /// 当前显示的内容视图
    private lazy var currentView = NSView()
    
    /// 信息按钮
    @IBOutlet weak var messageButton: TabbarBtn!

    /// 联系人按钮
    @IBOutlet weak var contactButton: TabbarBtn!

    /// 更多按钮
    @IBOutlet weak var moreButton: TabbarBtn!
    
//    /// itemd按钮点击事件
//    ///
//    /// - Parameter sender: TabbarBtn
//    @IBAction func itemButtomClicked(_ sender: TabbarBtn) {
//        //新旧选中状态切换
//        lastSelectBtn.selected = false
//        sender.selected = true
//        lastSelectBtn = sender
//    }
//
//    /// 点击消息选项卡
//    ///
//    /// - Parameter sender: NSButton
//    @IBAction func clickMessage(_ sender: NSButton) {
//        changeItemView(name: MessageKey, itemButton: sender)
//        print(sender.image?.name())
//    }
//
//
//    /// 点击联系人选项卡
//    ///
//    /// - Parameter sender: NSButton
//    @IBAction func clickContact(_ sender: NSButton) {
//        changeItemView(name: ContactKey, itemButton: sender)
//
//        print(sender.image?.name())
//    }
//
//
//    /// 点击更多选项卡
//    ///
//    /// - Parameter sender: NSButton
//    @IBAction func clickMore(_ sender: NSButton) {
//        changeItemView(name: MoreKey, itemButton: sender)
//         print(sender.image?.name())
//    }
//
    
    
    
    
    //绘制界面
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    

/*
     再用xib构建控件时, 可以通过这两个方法.
     系统会先调用 init?(coder aDecoder: NSCoder)方法, 然后再调用awakeFromNib(). 所以用哪个都可以.
     一般对控件做初始化操作用awakeFromNib()，添加子控件用init?(coder aDecoder: NSCoder)。
*/
    
    /**** 添加控件时调用 ****/
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configUI()

        
        
    }
    
   

    /**** 对控件初始化时调用 ****/
    override func awakeFromNib() {
        
    }
    
    
}


// MARK: - Custom Method
extension TabbarView {
    
    /// 配置UI界面
    private func configUI() {
        
        // 从xib中加载控件
        Bundle.main.loadNibNamed("TabbarView", owner: self, topLevelObjects: nil)
        
        // 添加控件
        addSubview(messageButton)
        addSubview(contactButton)
        addSubview(moreButton)
        
//        // 图片赋值
//        messageButton.normalImageName = "menu-message-normal"
//        messageButton.downImageName = "menu-message-down"
//        messageButton.selected = true
//        lastSelectBtn = messageButton
//
//        contactButton.normalImageName = "menu-contact-normal"
//        contactButton.downImageName = "menu-contact-down"
//
//        moreButton.normalImageName = "menu-more-normal"
//        moreButton.downImageName = "menu-more-down"
        
        // 取消按钮高亮状态，去掉点击时的灰色背景
//        (moreButton.cell as! NSButtonCell).highlightsBy = NSCell.StyleMask.init(rawValue: 0)
//        (contactButton.cell as! NSButtonCell).highlightsBy = NSCell.StyleMask.init(rawValue: 0)
//        (moreButton.cell as! NSButtonCell).highlightsBy = NSCell.StyleMask.init(rawValue: 0)
    }
    
//
//    /// 配置数据
//    private func configData(){
//        let messageVC = MessageViewController.controller()
//        controllerDict[MessageKey] = messageVC
//        let contactVC = ContactViewController.controller()
//        controllerDict[ContactKey] = contactVC
//        let moreVC = MoreViewController.controller()
//        controllerDict[MoreKey] = moreVC
//    }
//
//    /// 更换选项内容视图
//    ///
//    /// - Parameters:
//    ///   - name: 控制器名称
//    ///   - itemButton: 选项按钮
//    private func changeItemView(name: String, itemButton: NSButton) {
//
//        updateItemButton(name: name)
//
//        // 1. 根据name参数,获取对应选项视图的控制器
//        guard let currentVC = controllerDict[name]  else {return}
//
//        // 1.1. 过滤重复点击
//        if currentView == currentVC.view {return}
//
//        // 2. 将视图控制器的view 添加到内容视图中
////        containerView.replaceSubview(currentView, with: currentVC.view)
//        // 2.1 设置当前视图为控制视图
//        currentView = currentVC.view
//    }
    
    
    
    
    
//    // 刷新选项按钮
//    fileprivate func updateItemButton(name: String){
////        messageButton.image = NSImage(named: NSImage.Name(rawValue: "menu-message-normal"))
////        contactButton.image = NSImage(named: NSImage.Name(rawValue: "menu-contact-normal"))
////        moreButton.image = NSImage(named: NSImage.Name(rawValue: "menu-more-normal"))
//        
//        messageButton.image = NSImage(named: "menu-message-normal")
//        contactButton.image = NSImage(named: "menu-contact-normal")
//        moreButton.image = NSImage(named: "menu-more-normal")
//        
//        if name == MessageKey {
//            messageButton.image = NSImage(named: "menu-message-down")
//        }else if name == ContactKey{
//            contactButton.image = NSImage(named: "menu-contact-down")
//        }else{
//            moreButton.image = NSImage(named: "menu-more-down")
//        }
//    }
    
    
    
    
}
