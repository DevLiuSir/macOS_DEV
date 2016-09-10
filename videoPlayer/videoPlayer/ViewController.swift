//
//  ViewController.swift
//  videoPlayer
//
//  Created by Liu Chuan on 16/9/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var playerView: AVPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = NSURL(string: "http://images.apple.com/media/cn/iphone-7/2016/5937a0dc_edb0_4343_af1c_41ff71808fe5/films/materials/iphone7-materials-tft-cn-20160907_1536x640h.mp4") else {
            return
        }
        let player = AVPlayer(URL: url)
        playerView.player = player
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

