//
//  NaviMainVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class NaviMainVC: UIViewController {

    var naviPanInteraction: NaviPanInteraction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan: )))
        screen.edges = .right
        view.addGestureRecognizer(screen)
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let naviDetailVC = segue.destination as? NaviDetailVC {
            naviPanInteraction = NaviPanInteraction(naviDetailVC: naviDetailVC)
        }
    }
    
    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }
    
}


extension NaviMainVC:   UINavigationControllerDelegate{
    
    //视觉动画
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation{
        case .push:
            return PushAni()
        case .pop:
            return PopAni()         //返回时toView有阴影效果
        default:
            return nil
        }
    }
     
    //只有在执行pop时，才需要执行交互动画(即可以左右滑动)
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        //判断naviPanInteraction 是不是nil，是则返回（即判断用户有没有到达naviDetailVC，若到达才加pop交互动画）
        //用户执行完pop交互动画，isInteractive 为false，返回nil，不影响下一次的push动画
        guard let naviPanInteraction = naviPanInteraction, naviPanInteraction.isInteractive else{return nil}
        return naviPanInteraction
    }
    
    
    
}
