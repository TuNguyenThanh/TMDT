//
//  MenuViewController.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/20/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class MenuViewController: BaseView {
    
    let idCell:String   = "CellMenu"
    let idHeader:String = "CellHeader"
    
    override func setup() {
        self.addSubview(collectionViewMenu)
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: collectionViewMenu)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: collectionViewMenu)
        self.backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var collectionViewMenu:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let coll = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        coll.delegate = self
        coll.dataSource = self
        coll.register(HeaderMenuCollectionViewCell.self, forCellWithReuseIdentifier: self.idHeader)
        coll.register(MenuCollectionViewCell.self      , forCellWithReuseIdentifier: self.idCell)
        coll.backgroundColor = UIColor.clear
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
}

extension MenuViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.idHeader, for: indexPath) as! HeaderMenuCollectionViewCell
            cell.imgView.image = UIImage(named: "avatar")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            cell.lblName.text = "Nguyen Thanh Tu"
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.idCell, for: indexPath) as! MenuCollectionViewCell
        cell.lblTitle.text = "ABC"
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.frame.size.width, height: 200)
        }
        return CGSize(width: self.frame.size.width, height: 100)
    }
}
