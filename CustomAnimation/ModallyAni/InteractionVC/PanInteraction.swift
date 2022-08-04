//
//  PanInteraction.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

class PanInteraction: UIPercentDrivenInteractiveTransition {

    let modallyDetailVC: ModallyDetailVC
    var isInteractive = false
    
    init(modallyDetailVC: ModallyDetailVC) {
        //存储属性：一般属性，非计算属性
        //swift规定：先给所有存储属性（包括所有父类的）赋了值之后才能使用实例化的本对象（self）
        //swift规定：调用父类（super）前必须先给子类（本类）所有存储属性赋值
        self.modallyDetailVC = modallyDetailVC                //给子类（本类）所有存储属性赋值
        super.init()                            //给所有父类的存储属性赋值
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        modallyDetailVC.view.addGestureRecognizer(pan)
    }
    
    
    @objc func handlePan(pan: UIPanGestureRecognizer){
        //使用滑动距离和 200 的比，作为进度，当 progress = 0.5，表示用户滑100，动画进行1/2
        //用户右滑>=200，动画进度>=1，画面更新至完全dismiss
        //如果用户滑多少，detail页面就消失多少的话，除数可改为屏幕宽度—— UIScreen.main.bounds.width
        let progress = pan.translation(in: pan.view).x / 200
        
        switch pan.state{
        case .began:                    //交互状态动画
            isInteractive = true
            modallyDetailVC.dismiss(animated: true, completion: nil)
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
