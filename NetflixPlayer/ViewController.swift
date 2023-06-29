//
//  ViewController.swift
//  NetflixPlayer
//
//  Created by Pushpendra on 29/06/23.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var videoPlayer: UIView!
    @IBOutlet weak var videoPlayerHeight: NSLayoutConstraint!
    
    let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setVideoPlayer()
    }

    private var player : AVPlayer? = nil
    private var playerLayer : AVPlayerLayer? = nil
    
    private func setVideoPlayer() {
        guard let url = URL(string: videoURL) else { return }
        
        if self.player == nil {
            self.player = AVPlayer(url: url)
            self.playerLayer = AVPlayerLayer(player: self.player)
            self.playerLayer?.videoGravity = .resizeAspectFill
            self.playerLayer?.frame = self.videoPlayer.bounds
            if let playerLayer = self.playerLayer {
                self.videoPlayer.layer.addSublayer(playerLayer)
            }
            self.player?.play()
        }
    }
}

