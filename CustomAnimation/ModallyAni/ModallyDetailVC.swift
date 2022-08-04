//
//  ModallyDetailVC.swift
//  CustomAnimation
//
//  Created by gbt on 2022/7/22.
//

import UIKit

class ModallyDetailVC: UIViewController {

    @IBOutlet weak var detailImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAction(tap:)))
        detailImgView.addGestureRecognizer(tap)
        
    }

    @objc func handleTapAction(tap: UITapGestureRecognizer){
        if tap.state == .ended{
            dismiss(animated: true, completion: nil)
        }
    }

}
