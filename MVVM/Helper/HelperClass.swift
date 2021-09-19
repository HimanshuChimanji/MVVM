//
//  HelperClass.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 19/09/21.
//

import UIKit

extension UIView {
    func loadHeaderView(_ viewController: UIViewController, title: String, backButtonImage: UIImage?) {
        let header : HeaderView = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)! [0] as! HeaderView
        header.delegate = viewController as? HeaderViewDelegate
        header.menuTitleLbl.text = title
        if backButtonImage != nil {
            header.backBtn.isHidden = false
            header.backBtn.setTitle("", for: .normal)
            header.backBtn.setImage(backButtonImage, for: .normal)
        }
        else {
            header.backBtn.isHidden = true
        }
        self.addSubview(header)
    }
}
