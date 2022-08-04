//
//  CodeVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/25.
//

import UIKit

class CodeVC: UIViewController {

    //lazy,在使用时再加载
    private lazy var codePlayerVC = storyboard!.instantiateViewController(withIdentifier: "CodePlayerVCID")
    private lazy var codeTableVC = storyboard!.instantiateViewController(withIdentifier: "CodeTableVCID")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let screen = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenAction(screenEdgePan:)))
        screen.edges = .right
        view.addGestureRecognizer(screen)
        
        addChild(codePlayerVC)
        addChild(codeTableVC)
        

        let playerView = codePlayerVC.view!
        let tableView = codeTableVC.view!
        let safeArea = view.safeAreaLayoutGuide
        playerView.translatesAutoresizingMaskIntoConstraints = false         //取消自动布局
        tableView.translatesAutoresizingMaskIntoConstraints = false         //取消自动布局
        
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            playerView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            playerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: playerView.bottomAnchor, constant: 8)
        ])
        
        
        codePlayerVC.didMove(toParent: self)
        codeTableVC.didMove(toParent: self)
        
    }
    
//    override func viewDidLayoutSubviews() {
//
//        addChild(codePlayerVC)
//        addChild(codeTableVC)
//        codePlayerVC.view.frame.size.width = view.safeAreaLayoutGuide.layoutFrame.width
//        codePlayerVC.view.frame.size.height = 300
//        codePlayerVC.view.frame.origin = view.safeAreaLayoutGuide.layoutFrame.origin       //codePlayerVC的原点
//        view.addSubview(codePlayerVC.view)
//
//        codeTableVC.view.frame.size.width = view.safeAreaLayoutGuide.layoutFrame.width
//        codeTableVC.view.frame.size.height = 300
//        codeTableVC.view.frame.origin = view.safeAreaLayoutGuide.layoutFrame.origin       //codePlayerVC的原点
//        view.addSubview(codeTableVC.view)
//
//        codePlayerVC.didMove(toParent: self)
//        codeTableVC.didMove(toParent: self)
//    }

    func  removeContainerView(child: UIViewController){
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()

    }
    
    
    
    @objc func screenAction(screenEdgePan: UIScreenEdgePanGestureRecognizer){
        let x = screenEdgePan.translation(in: view).x
        if x < 50{
            dismiss(animated: true, completion: nil)
        }
    }

    
}
