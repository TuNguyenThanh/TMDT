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
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    let viewLine:UIView = {
        let vi = UIView()
        vi.layer.cornerRadius = 2
        vi.clipsToBounds = true
        vi.translatesAutoresizingMaskIntoConstraints = false
        return vi
    }()
    
    override var isSelected: Bool{
        didSet{
            if isSelected == true {
                self.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                viewLine.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                self.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                viewLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    override func setup() {
        self.addSubview(imgMenuView)
        self.addSubview(viewLine)
        self.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        imgMenuView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imgMenuView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imgMenuView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 4/5, constant: 0).isActive = true
        imgMenuView.widthAnchor.constraint(equalTo: imgMenuView.heightAnchor, multiplier: 1, constant: 0).isActive = true
        
        self.addConstrainWithVisualFormat(VSFormat: "H:|-10-[v0]-10-|", views: viewLine)
        self.addConstrainWithVisualFormat(VSFormat: "V:[v0(5)]|", views: viewLine)
    }
}
