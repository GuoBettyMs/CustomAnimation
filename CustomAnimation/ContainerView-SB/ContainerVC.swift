//
//  ContainerVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/25.
//

import UIKit

class ContainerVC: UIViewController {

    var playerVC: AVplayerVC!
    var tableVC: TableVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan:)))
        screen.edges = .right
        view.addGestureRecognizer(screen)
        
        // 获取子视图控制器
        playerVC = (storyboard!.instantiateViewController(withIdentifier: "playerVC") as! AVplayerVC)
        tableVC = storyboard!.instantiateViewController(withIdentifier: "tableVC") as! TableVC
    
    
        print("父视图控制器 ContainerVC")
    }
    
    // MARK: 获取子视图控制器
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueAVPlayerVC"{
//            playerVC = (segue.destination as! AVplayerVC)
//        }else if segue.identifier == "segueTableVC"{
//            tableVC = (segue.destination as! TableVC)
//        }
        
        if let vc = segue.destination as? AVplayerVC{
            playerVC = vc
        }
        if let vc = segue.destination as? TableVC{
            tableVC = vc
        }
        
    }
    
    
    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }

}
