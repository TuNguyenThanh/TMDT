//
//  BaseView.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/16/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class BaseView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
    }
}
