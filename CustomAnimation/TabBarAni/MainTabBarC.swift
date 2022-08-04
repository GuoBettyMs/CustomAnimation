//
//  MainTabBarC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

enum Operation{
    //toRight 相当于 push，toLeft 相当于 pop
    case toRight, toLeft
}

class MainTabBarC: UITabBarController {

    var interactionAni: InteractionAni!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactionAni = InteractionAni(tabBarC: self)
        self.delegate = self
        
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
    
}


extension MainTabBarC: UITabBarControllerDelegate{
    
    //非交互动画
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers!.firstIndex(of: fromVC)!
        let toIndex = tabBarController.viewControllers!.firstIndex(of: toVC)!
        
        let operation: Operation! = toIndex > fromIndex ? .toRight : .toLeft
        
        return Ani(operation: operation)
    }
    
    //交互动画
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionAni.isInteractive ? interactionAni : nil
    }
}
