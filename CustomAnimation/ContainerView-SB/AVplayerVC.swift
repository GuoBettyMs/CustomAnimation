//
//  AVplayerVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/25.
//

import UIKit
import AVKit

class AVplayerVC: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let player = AVPlayer(url: Bundle.main.url(forResource: "BirdAni", withExtension: "mp4")!)
        self.player = player
        
        print("子视图控制器 AVplayerVC")
    }


}
