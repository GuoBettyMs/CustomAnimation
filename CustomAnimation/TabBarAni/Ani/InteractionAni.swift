//
//  InteractionAni.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class InteractionAni: UIPercentDrivenInteractiveTransition {

    var isInteractive = false
    let tabBarC: MainTabBarC
    
    init(tabBarC: MainTabBarC) {
        self.tabBarC = tabBarC
        super.init()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        tabBarC.view.addGestureRecognizer(pan)
    }
    
    
    @objc func handlePan(pan: UIPanGestureRecognizer){
        
        let translationX = pan.translation(in: pan.view).x            //起始位置
        let progress = abs(translationX / 200)                        //平移距离,因为方向有两个，translationX有正负值，所以需取绝对值
        
        switch pan.state{
        case .began:
             isInteractive = true

            //用户能够左右滑的 最小 前提是，tabBarC.viewControllers!.count = 2 （【0，1】）
            if translationX < 0{
                //用户往左滑，相当于 toRight， 当tabBarC.selectedIndex最大为0 时才可能toRight，从而Index +1
                if tabBarC.selectedIndex <= tabBarC.viewControllers!.count - 2{
                    tabBarC.selectedIndex += 1
                }
            }else{
                //用户往右滑，相当于 toLeft， 当tabBarC.selectedIndex最小为1 时才可能toLeft，从而Index -1
                if tabBarC.selectedIndex >= 1{
                    tabBarC.selectedIndex -= 1
                }
            }
            
        case .changed:
            update(progress)
        case .cancelled, .ended:
            isInteractive = false
            if progress > 0.5{
                finish()
            }else{
                cancel()
            }
        default:
            break
        }
        
        
    }
}
