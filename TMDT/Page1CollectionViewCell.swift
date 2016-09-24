//
//  Page1CollectionViewCell.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/13/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class Page1CollectionViewCell: BaseCollectionViewCell {
    let viewBanner:BannerView = BannerView()
    
    lazy var slideColl:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let coll = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        coll.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        coll.delegate = self
        coll.dataSource = self
        coll.register(HeaderSlideCollectionViewCell.self, forCellWithReuseIdentifier: "CellHeaderSlider")
        coll.register(InfoSliderCollectionViewCell.self , forCellWithReuseIdentifier: "CellInfoSlider")
        return coll
    }()
    
    override func setup() {
        self.addSubview(slideColl)
        self.addSubview(viewBanner)
        
        self.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: slideColl)
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: slideColl)
        
        viewBanner.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewBanner.heightAnchor.constraint(equalToConstant: 250).isActive = true
        self.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: viewBanner)
    }
}

extension Page1CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellHeaderSlider", for: indexPath) as! HeaderSlideCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellInfoSlider", for: indexPath) as! InfoSliderCollectionViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = slideColl.contentOffset.y
        if y < 0 {
            viewBanner.constraints.last?.constant = 250 + -y
        }else{
            viewBanner.constraints.last?.constant = 250 - y
        }
    }
}

extension Page1CollectionViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.frame.size.width, height: 250)
        }
        return CGSize(width: self.frame.size.width , height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
