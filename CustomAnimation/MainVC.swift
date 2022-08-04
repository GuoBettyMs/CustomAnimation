//
//  ViewController.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

class MainVC: UIViewController {
 
    
    @IBOutlet weak var pageController: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}



extension MainVC: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let viewWidth = view.bounds.width
        
        let pageIndex = round(x / viewWidth)
        pageController.currentPage = Int(pageIndex)
        
        if x > (viewWidth * 2 + 50){
            let homeVC = storyboard!.instantiateInitialViewController()!
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: true, completion: nil)
        }
    }
}
