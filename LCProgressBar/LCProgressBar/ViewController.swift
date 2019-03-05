//
//  ViewController.swift
//  LCProgressBar
//
//  Created by Liu Chuan on 2019/2/14.
//  Copyright © 2019 Liu Chuan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    private lazy var progressBarView: LCProgressBarView = {
        let view = LCProgressBarView(frame: self.view.frame)
        view.barColor = NSColor.green
        view.trackColor = NSColor.systemGray
        view.wantsLayer = true     //设置背景颜色
        view.layer?.backgroundColor = NSColor.darkGray.cgColor
        view.barThickness = 10
        view.progressValue = 10
        return view
    }()
    
    
    /// 定时器
    private lazy var timer = Timer()
        

    override func viewDidLoad() {
        super.viewDidLoad()

        view = progressBarView
        
        // 定时器监听
        // 0.1秒更新一次, 更新方法, 一直循环
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animate), userInfo: nil, repeats: true)
        
    }
    
    
    /// 定时器事件
    @objc private func animate() {
        if progressBarView.progressValue <= 100 {
            progressBarView.progressValue += 1
        }else {
            // 失效
            timer.invalidate()
            // 归零
            progressBarView.progressValue = 0
        }
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

