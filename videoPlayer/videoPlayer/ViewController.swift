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

        guard let url = URL(string: "http://images.apple.com/media/cn/macbook-pro/2016/b4a9efaa_6fe5_4075_a9d0_8e4592d6146c/films/design/macbook-pro-design-tft-cn-20161026_1536x640h.mp4") else {
            return
        }
        let player = AVPlayer(url: url)
        playerView.player = player
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

