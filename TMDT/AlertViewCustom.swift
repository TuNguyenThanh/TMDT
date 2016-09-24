//
//  AlertViewCustom.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/22/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class AlertViewCustom:BaseView {
    let viewAlertMain:UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        v.isHidden = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.7)
        
        self.addSubview(viewAlertMain)
        viewAlertMain.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        viewAlertMain.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        viewAlertMain.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        viewAlertMain.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2).isActive = true
        
        let tapGestuer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AlertViewCustom.tapAction))
        self.addGestureRecognizer(tapGestuer)
    }
    
    func tapAction(){
        self.isHidden = true
    }
    
    func showAlert(){
        viewAlertMain.isHidden = false
    }
    
    func hidenAlert(){
        viewAlertMain.isHidden = false
    }
}
