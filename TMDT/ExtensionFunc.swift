//
//  funcExtension.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/13/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addConstrainWithVisualFormat(VSFormat:String,views:UIView...){
        var dic = Dictionary<String,UIView>()
        for (index,value) in views.enumerated(){
            let key:String = "v\(index)"
            value.translatesAutoresizingMaskIntoConstraints = false
            dic[key] = value
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: VSFormat, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
}

