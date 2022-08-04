//
//  PresentAni.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

//动画自定义器
class PresentAni: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from),
        let toView = transitionContext.view(forKey: .to) else{return}
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromView.alpha = 0
                fromView.transform = CGAffineTransform(translationX: -containerView.frame.width, y: 0)      //fromView 为mainView
                toView.alpha = 1
                toView.transform = .identity              //属性清零
        }) { _ in
            
            fromView.transform = .identity
            toView.transform = .identity
            
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)          //使动画形成一个闭合
        }
        
        
    }
}
