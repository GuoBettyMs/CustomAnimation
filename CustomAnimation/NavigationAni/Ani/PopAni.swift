//
//  PopAni.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class PopAni: NSObject, UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
        let toView = transitionContext.view(forKey: .to) else{return}
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        //将toView放到fromView的下面
        containerView.insertSubview(toView, belowSubview: fromView)

        fromView.layer.shadowOpacity = 0.5              //增加阴影
        fromView.layer.shadowRadius = 10              //增加阴影圆角
        //若没指定shadowPath，系统会自动帮我们找到对应的view（计算大小和位置）渲染阴影，那样比较耗费资源
        fromView.layer.shadowPath = UIBezierPath(rect: fromView.bounds).cgPath
        
        toView.alpha = 1
        toView.transform = CGAffineTransform(translationX: -containerView.frame.width/3, y: 0)          //在用户平移的时候，toView已出现部分View

        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)      //fromView 为mainView
                toView.transform = .identity              //属性清零
        }) { _ in
            
            fromView.transform = .identity
            toView.transform = .identity
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)          //使动画形成一个闭合
        }
    }
    

}
