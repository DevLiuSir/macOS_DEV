//
//  ViewController.swift
//  WebView
//
//  Created by Liu Chuan on 16/6/5.
//  Copyright © 2016年 LC. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var web: WebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        web.mainFrameURL = "http://www.apple.com.cn"
        
        
        //let webview = WebView(frame: NSRect(x:self.view.bounds.origin, y:self.view.bounds.origin.y , width: self.view.bounds.origin, height: self.view.bounds.width))
        
        //let webview = WebView(frame: NSRect(x: 0, y: 30, width: 1500, height: 700))
        //webview.mainFrameURL  = "http://chinahackers.github.io/"
        //webview.mainFrameURL = "http://tv.yinyuetai.com/#channelId=1"
        
        
 
    }
    


    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
            
            
        }
    }


}

