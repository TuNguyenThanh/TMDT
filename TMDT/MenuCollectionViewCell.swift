//
//  MenuCollectionViewCell.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/20/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: BaseCollectionViewCell {
   
    let lblTitle:UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func setup() {
        self.backgroundColor = UIColor.clear
        self.addSubview(lblTitle)
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: lblTitle)
        self.addConstrainWithVisualFormat(VSFormat: "H:|-20-[v0]|", views: lblTitle)
    }
    
}
