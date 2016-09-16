//
//  MenuBarCollectionViewCell.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/16/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import Foundation
import UIKit

class MenuBarCollectionViewCell: BaseCollectionViewCell {
    let imgMenuView:UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "settings")
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    override func setupView() {
        self.addSubview(imgMenuView)
        imgMenuView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgMenuView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgMenuView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 4/5, constant: 0).isActive = true
        imgMenuView.widthAnchor.constraint(equalTo: imgMenuView.heightAnchor, multiplier: 1, constant: 0).isActive = true
    }
}
