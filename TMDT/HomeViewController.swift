//
//  ViewController.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/13/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cellId = "Cell"
    var arrIdCell:Array<String> = ["Cell1","Cell2","Cell3","Cell4"]
    let menuBar:MenuBarViewController = MenuBarViewController()
    
    lazy var myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        collectionView.register(Page1CollectionViewCell.self, forCellWithReuseIdentifier: "Cell1")
        collectionView.register(Page2CollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")
        collectionView.register(Page3CollectionViewCell.self, forCellWithReuseIdentifier: "Cell3")
        collectionView.register(Page4CollectionViewCell.self, forCellWithReuseIdentifier: "Cell4")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.magenta
        setupMenuBar()
        setupCollectionViewMain()
    }

    func setupCollectionViewMain(){
        self.title = "Home"
        self.view.addSubview(myCollectionView)
        
        //automaticallyAdjustsScrollViewInsets = false
        //myCollectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        /*myCollectionView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 10).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true*/
        
        automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: menuBar.topAnchor, constant: 0).isActive = true
        self.view.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: myCollectionView)
    }
    
    func setupMenuBar(){
        self.view.addSubview(menuBar)
        self.view.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|"   , views: menuBar)
        self.view.addConstrainWithVisualFormat(VSFormat: "V:[v0(50)]|", views: menuBar)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrIdCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.arrIdCell[indexPath.row], for: indexPath)
        /*switch cell.reuseIdentifier! as String{
        case "Cell1":
            cell as! Page1CollectionViewCell
        case "Cell2":
            cell as! Page2CollectionViewCell
        case "Cell3":
            cell as! Page3CollectionViewCell
            
        default:
            cell as! Page4CollectionViewCell
        }*/
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0.0
        UIView.animate(withDuration: 1) { 
            cell.alpha = 1.0
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}



