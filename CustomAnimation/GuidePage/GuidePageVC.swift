//
//  GuidePageVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/26.
//

import UIKit

class GuidePageVC: UIViewController {


//    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan:)))
//        screen.edges = .right
//        view.addGestureRecognizer(screen)
//
//
        
    }
    
    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }

}

//extension GuidePageVC: UIScrollViewDelegate{
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let x = scrollView.contentOffset.x
//        let viewWidth = view.bounds.width
//        
//        let pageIndex = round(x / viewWidth)
//        pageControl.currentPage = Int(pageIndex)
//        
//        if x > (viewWidth * 2 + 50){
//            let homeVC = storyboard!.instantiateInitialViewController()!
//            homeVC.modalPresentationStyle = .fullScreen
//            present(homeVC, animated: true, completion: nil)
//        }
//    }
//}
