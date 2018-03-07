//
//  HomeViewController.swift
//  TabBarExample-macOS
//
//  Created by Liu Chuan on 2017/12/14.
//  Copyright © 2018 LC. All rights reserved.
//

import Cocoa

private let MessageKey = "Message"
private let ContactKey = "Contact"
private let MoreKey = "More"

class HomeViewController: NSViewController {

    // MARK: - Lazy property
    /// 选项控制器字典
    private lazy var controllerDict = [String : NSViewController]()
    
    /// 当前显示的内容视图
    private lazy var currentView = NSView()
    
    // MARK: - Control Property
    @IBOutlet weak var containerView: NSView!
    @IBOutlet weak var effectView: NSVisualEffectView!
    @IBOutlet weak var tabbarView: TabbarView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configData()
    }
    
    
//    override func viewDidAppear() {
//        
//        // 操作layer属性必须加，否则无效
//        view.wantsLayer = true
//        // 设置图层背景色
//        view.layer?.backgroundColor = NSColor.white.cgColor
//        // 毛玻璃的风格
//        effectView.material = NSVisualEffectView.Material.light
//    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}


// MARK: - Custom Method
extension HomeViewController {
    
    /// 配置数据
    private func configData(){
        let messageVC = MessageViewController.controller()
        controllerDict[MessageKey] = messageVC
        let contactVC = ContactViewController.controller()
        controllerDict[ContactKey] = contactVC
        let moreVC = MoreViewController.controller()
        controllerDict[MoreKey] = moreVC
    }
    
    /// 配置UI
    private func configUI() {
        
        /* 为按钮绑定点击事件 */
        tabbarView.messageButton.action = #selector(clickMessage(_:))
        tabbarView.moreButton.action = #selector(clickMore(_:))
        tabbarView.contactButton.action = #selector(clickContact(_:))
        
        currentView.frame = view.bounds
        containerView.addSubview(currentView)
        // 默认选中消息选项卡
        clickMessage(tabbarView.messageButton)
    }
    
    
    /// 更新选项内容视图
    ///
    /// - Parameters:
    ///   - name: 控制器名称
    ///   - itemButton: 选项按钮
    private func changeItemView(name: String, itemButton: NSButton) {
        
        updateItemButton(name: name)
        
        // 1. 根据name参数,获取对应选项视图的控制器
        guard let currentVC = controllerDict[name]  else {return}
        
        // 1.1. 过滤重复点击
        if currentView == currentVC.view {return}
        
        // 2. 将视图控制器的view 添加到内容视图中
        containerView.replaceSubview(currentView, with: currentVC.view)
        
        // 2.1 设置当前视图为控制视图
        currentView = currentVC.view
        
        // 3. 设置当前内容视图的约束
//        currentView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        
        currentView.frame = super.view.frame
        
    }
    
    
    /// 更新选项按钮图片
    ///
    /// - Parameter name: key
    private func updateItemButton(name: String){
        tabbarView.messageButton.image = NSImage(named: "menu-message-normal")
        tabbarView.contactButton.image = NSImage(named: "menu-contact-normal")
        tabbarView.moreButton.image = NSImage(named: "menu-more-normal")
        
        if name == MessageKey {
            tabbarView.messageButton.image = NSImage(named: "menu-message-down")
        }else if name == ContactKey{
            tabbarView.contactButton.image = NSImage(named: "menu-contact-down")
        }else{
            tabbarView.moreButton.image = NSImage(named: "menu-more-down")
        }
    }
}


// MARK: - Click Event
extension HomeViewController {
    
    /// 信息按钮点击事件
    ///
    /// - Parameter sender: NSButton
    @objc private func clickMessage(_ sender: NSButton) {
        changeItemView(name: MessageKey, itemButton: sender)
    }
    
    /// 更多按钮点击事件
    ///
    /// - Parameter sender: NSButton
    @objc private func clickMore(_ sender: NSButton) {
        changeItemView(name: MoreKey, itemButton: sender)
    }
    
    /// 联系人按钮点击事件
    ///
    /// - Parameter sender: NSButton
    @objc private func clickContact(_ sender: NSButton) {
        changeItemView(name: ContactKey, itemButton: sender)
    }
}
