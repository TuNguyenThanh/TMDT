//
//  HomeCollectionViewCell.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/13/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    let imgView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func setupView(){
        self.backgroundColor = UIColor.blue
        self.addSubview(imgView)
        
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: imgView)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: imgView)
    }
}
