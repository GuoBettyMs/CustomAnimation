//
//  AVPlayerVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/25.
//

import UIKit
import AVKit

class VC: UIViewController {

    
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerTabView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan:)))
        screen.edges = .right
        view.addGestureRecognizer(screen)
        
        
        //创建一个带视频的播放器—— 类似于添加一个mp4视频进暴风影音，视频资源来自于本地，使用 Bundle.main.url获取
        let player = AVPlayer(url: Bundle.main.url(forResource: "BirdAni", withExtension: "mp4")!)
        
        
        //添加layer显示视频
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = playerView.bounds
//        playerView.layer.addSublayer(playerLayer)
        
        //视频控制按钮
//        player.play()           //自动播放
//        player.pause()
//        player.rate
//        player.replaceCurrentItem(with: AVPlayerItem(url: URL))     //更换视频
       
        
        //AVPlayerViewController 有系统自带的各种控件
        let childplayerVC = AVPlayerViewController()
        childplayerVC.player = player            //添加layer用来显示视频
        
        //把控制器放到故事版的视频View（playerView）里，就是在本控制器上添加子控制器，并把子控制器的根视图加到故事版的视频View（playerView）中
        addChild(childplayerVC)                  //1.添加子控制器
        
        //2.给子控制器的根视图设定frame或约束，并把它添加到容器视图（playerView）的视图层级（hierarchy）中
        childplayerVC.view.frame = playerView.bounds
        playerView.addSubview(childplayerVC.view)
        childplayerVC.didMove(toParent: self)                 //3.保证子控制器的生命周期函数正常执行
        
    }
    
    
    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }

}

extension VC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTabView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = "评论+++"
        return cell
    }
    
    
}
