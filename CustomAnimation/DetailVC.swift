//
//  DetailVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/21.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func modallyAni(_ sender: Any) {
        
        let mainSB = UIStoryboard(name: "ModallyMain", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "ModallyMainVCID") as!  ModallyMainVC
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    @IBAction func naviAni(_ sender: Any) {
        
        let mainSB = UIStoryboard(name: "NaviMain", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "NaviMainVCID") as!  NaviMainVC
        let rootViewController = UINavigationController(rootViewController: mainVC)
        rootViewController.modalPresentationStyle = .fullScreen
        present(rootViewController, animated: true, completion: nil)
    }
    
    @IBAction func tabBarAni(_ sender: Any) {
        let mainSB = UIStoryboard(name: "TabBarMain", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "MainTabBarCID") as!  MainTabBarC
        let rootViewController = UINavigationController(rootViewController: mainVC)
        rootViewController.modalPresentationStyle = .fullScreen
        present(rootViewController, animated: true, completion: nil)
    }
    
    @IBAction func AVplayerAni(_ sender: Any) {
        let mainSB = UIStoryboard(name: "AVplayerMain", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "VCID") as!  VC
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    
    @IBAction func ContainerViewSBAct(_ sender: Any) {
        let mainSB = UIStoryboard(name: "ContainerView", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "ContainerVCID") as!  ContainerVC
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    

    @IBAction func ContainerViewSBCodeAct(_ sender: Any) {
        let mainSB = UIStoryboard(name: "CodeVC", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "CodeVCID") as! CodeVC
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    
    @IBAction func GuidePageAct(_ sender: Any) {
        let mainSB = UIStoryboard(name: "GuidePage", bundle: nil)
        let mainVC = mainSB.instantiateViewController(withIdentifier: "GuidePageVCID") as! GuidePageVC
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }


}
