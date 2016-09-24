//
//  BannerView.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/24/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class BannerView:BaseView {
    let imgBg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        return img
    }()
    
    override func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgBg)
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: imgBg)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: imgBg)
        
        
    }
}
