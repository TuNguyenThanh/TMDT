//
//  MenuBar.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/16/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import Foundation
import UIKit

class MenuBarViewController: BaseView {
    let arrIcon:Array<String> = ["cart","head","heart","house","settings"]
    
    let cellId:String = "CellMenu"
    
    lazy var myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.showsHorizontalScrollIndicator = false
        coll.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        coll.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        coll.delegate = self
        coll.dataSource = self
        return coll
    }()
    
    override func setup() {
        self.addSubview(myCollectionView)
        
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: myCollectionView)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: myCollectionView)
    }
}

extension MenuBarViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! MenuBarCollectionViewCell
        
        return cell
    }
}

extension MenuBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width / CGFloat(self.arrIcon.count), height: frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


