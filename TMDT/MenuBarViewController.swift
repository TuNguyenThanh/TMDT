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
    let cellId:String = "CellMenu"
    let arrIcon:Array<String> = ["house","head","cart","heart","settings"]
   
    lazy var collMenuBar:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.showsHorizontalScrollIndicator = false
        coll.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        coll.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
        coll.dataSource = self
        return coll
    }()
    
    override func setup() {
        self.addSubview(collMenuBar)
        
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: collMenuBar)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: collMenuBar)
    }
}

extension MenuBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! MenuBarCollectionViewCell
        cell.imgMenuView.image = UIImage(named: self.arrIcon[indexPath.row])?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        return cell
    }
}

