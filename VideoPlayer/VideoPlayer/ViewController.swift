//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Liu Chuan on 2020/4/7.
//  Copyright © 2020 Liu Chuan. All rights reserved.
//

import Cocoa
import AVFoundation
import AVKit

class ViewController: NSViewController {
    
    @IBOutlet weak var videoView: AVPlayerView!
    
    private var player: AVPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        playStreamMedia()
        
        //playLocalVideo()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

//MARK: - playVideo
extension ViewController {
    
    /// 播放流媒体
    private func playStreamMedia() {
        let videoURL = "https://www.apple.com/jobs/global/media/acvideo/2020-index/us/2020USHero-HD-cc-us-2020_1920x1080h.mp4"
        guard let url = URL(string: videoURL) else { return }
        player = AVPlayer(url: url)
        videoView.player = player
    }
    
    /// 播放本地视频
    private func playLocalVideo() {

        guard let videoPath = Bundle(for: type(of: self)).path(forResource: "Fall_2018", ofType: "mov") else { return }

        let fileURL = NSURL.fileURL(withPath: videoPath)

        let asset = AVAsset(url: fileURL)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: player!)
        playerLayer.frame = self.videoView.frame

        videoView.player = player

        //loop
        player!.actionAtItemEnd = .none

        // add notification
        NotificationCenter.default.addObserver(self, selector: #selector(restartVideo), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)

        player?.play()
    }

    /// 重新启动视频 (播放完成后循环播放 )
    @objc func restartVideo() {
        let seconds:Int64 = 0
        let preferredTimeScale: Int32 = 1
        let seekTime:CMTime = CMTimeMake(value: seconds, timescale: preferredTimeScale)
        player!.seek(to: seekTime)
        player!.play()
    }

}


