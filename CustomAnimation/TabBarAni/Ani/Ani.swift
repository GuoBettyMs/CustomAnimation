//
//  Ani.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class Ani: NSObject, UIViewControllerAnimatedTransitioning {
    
    let operation: Operation!
    
    init(operation: Operation){
        self.operation = operation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else{return}
        
        containerView.addSubview(toView)
        let offset = containerView.frame.width
        toView.frame.origin.x = operation == .toRight ? offset : -offset
        toView.alpha = 0
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromView.alpha = 0
                fromView.frame.origin.x = self.operation == .toRight ? -offset : offset
                
                toView.alpha = 1
                //由于前面是使用origin 对view偏移，因此结束时也需使用origin恢复
                //当operation为toRight时，toView由offset位置平移了（-offset），最终位置为0
                //当operation为toLeft时，toView由（-offset）位置平移了offset，最终位置为0
                //即不管operation往哪个方向，toView的位置都是0
                toView.frame.origin.x = 0
            },completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        
        
    }
    

    
}
