//
//  HeaderMenuCollectionViewCell.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/22/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class HeaderMenuCollectionViewCell: BaseCollectionViewCell {
    
    let imgView:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let lblName:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func setup() {
        self.backgroundColor = UIColor.clear
        self.addSubview(imgView)
        self.addSubview(lblName)
        
        self.addConstrainWithVisualFormat(VSFormat: "V:|-30-[v0]-30-|", views: imgView)
        imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, multiplier: 1).isActive = true
        imgView.layer.cornerRadius = (self.frame.size.height - 60 ) / 2
        
        lblName.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10).isActive = true
        lblName.leftAnchor.constraint(equalTo: imgView.leftAnchor).isActive = true
        lblName.rightAnchor.constraint(equalTo: imgView.rightAnchor).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
