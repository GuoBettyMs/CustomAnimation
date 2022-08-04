//
//  NaviPanInteraction.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class NaviPanInteraction: UIPercentDrivenInteractiveTransition {
    
    let naviDetailVC: NaviDetailVC
    var isInteractive = false
    
    init(naviDetailVC: NaviDetailVC) {

        self.naviDetailVC = naviDetailVC                //给子类（本类）所有存储属性赋值
        super.init()                                    //给所有父类的存储属性赋值
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        naviDetailVC.view.addGestureRecognizer(pan)
    }
    
    
    @objc func handlePan(pan: UIPanGestureRecognizer){

        let progress = pan.translation(in: pan.view).x / 200
        
        switch pan.state{
        case .began:                    //交互状态动画
            isInteractive = true
            naviDetailVC.navigationController?.popViewController(animated: true)
        case .changed:                  //交互状态动画
            //手在拖动时，不断的更新画面；通过update 设置转场过程动画进行的百分比，系统会根据百分比自动布局动画控件
            update(progress)
        case .cancelled, .ended:        //非交互状态动画，ended表示用户松开手指
            isInteractive = false
            if  progress > 0.5{
                finish()            //完成剩余动画
            }else{
                cancel()            //取消刚才的动画
            }
        default:
            break
        }
        
    }
}
