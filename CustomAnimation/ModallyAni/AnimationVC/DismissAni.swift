//
//  DismissAni.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

class DismissAni: NSObject,  UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let fromView = transitionContext.view(forKey: .from),
        let toView = transitionContext.view(forKey: .to) else{return}
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: -containerView.frame.width, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromView.alpha = 0
                fromView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)       //fromView 为detailView
                
                toView.alpha = 1
                toView.transform = .identity                //属性清零
        }) { _ in
            //fromView 虽然被自动从containView 里面移除了，但附在身上的transform 属性还在，为了防止两次动画交错，需要置空
            fromView.transform = .identity
            //toView 的transform在动画块里面置空了，但如果交互动画时用户取消了转场，就会被附上初始时定的transform，所以为了不干扰下一次动画，需要置空
            toView.transform = .identity
            
            //如果动画没有取消，完成闭合
            //transitionWasCancelled 如果动画被取消了，必须撤销之前对视图层级所做的修改,若不撤销，fromView.alpha = 0，无法看到view
            //（!transitionContext.transitionWasCancelled），Bool = true，执行completeTransition
            
            //一定要调用completeTransition，不然页面会卡住
            //调用后UIKit 才会结束整个动画流程，并把控制权交给App，用户才可以继续操作页面
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)          //使动画形成一个闭合
        }
        
    }
    

}
