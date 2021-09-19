//
//  HeaderView.swift
//  MVVM
//
//  Created by Himanshu Chimanji on 19/09/21.
//

import UIKit
protocol HeaderViewDelegate {
    func backButtonAction()
}

class HeaderView: UIView {

    var delegate: HeaderViewDelegate?
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var menuTitleLbl: UILabel!
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        delegate?.backButtonAction()
    }
}
