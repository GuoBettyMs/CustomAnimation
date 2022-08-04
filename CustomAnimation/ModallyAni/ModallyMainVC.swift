//
//  ViewController.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

class ModallyMainVC: UIViewController {

    var panInteraction: PanInteraction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan:)))
        screen.edges = .right
        view.addGestureRecognizer(screen)
    }

    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: modally 转场动画
    @IBAction func showDetail(_ sender: Any) {
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "ModallyDetailVCID") as!  ModallyDetailVC
        
        //在present 之前指定代理人，让代理人return 自定义动画器
        //若优先执行自定义动画，若动画器为nil，则执行系统动画
        detailVC.transitioningDelegate = self
        
        panInteraction = PanInteraction(modallyDetailVC: detailVC)
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
    }
    

}


extension ModallyMainVC: UIViewControllerTransitioningDelegate{
    
    //非交互动画 —— 视觉动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAni()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAni()
    }
    
    //非交互动画 —— 主要是手势交互
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return panInteraction.isInteractive ?  panInteraction : nil             //若动画器为nil，则执行系统动画
    }
    
}
