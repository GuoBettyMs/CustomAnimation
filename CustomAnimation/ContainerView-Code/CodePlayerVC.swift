//
//  CodePlayerVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/25.
//

import UIKit
import AVKit

class CodePlayerVC: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let player = AVPlayer(url: Bundle.main.url(forResource: "BirdAni", withExtension: "mp4")!)
        self.player = player
        
    }
    


}
