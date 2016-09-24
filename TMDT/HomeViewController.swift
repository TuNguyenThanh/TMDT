//
//  HomeController.swift
//  TMDT
//
//  Created by Nguyễn Thanh Tú on 9/13/16.
//  Copyright © 2016 ThanhTu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let arrIdCell:Array<String> = ["Cell1","Cell2","Cell3","Cell4","Cell5"]
    let menuBar:MenuBarViewController = MenuBarViewController()
    let viewMenu:MenuViewController   = MenuViewController()
    let viewAlert:AlertViewCustom     = AlertViewCustom()
    
    var isMenu:Bool = false
    
    let imgBg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bgMenu")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let viewBg:UIView = {
        let vi = UIView()
        vi.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        vi.translatesAutoresizingMaskIntoConstraints = false
        return vi
    }()
    
    lazy var myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(Page1CollectionViewCell.self, forCellWithReuseIdentifier: "Cell1")
        collectionView.register(Page2CollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")
        collectionView.register(Page3CollectionViewCell.self, forCellWithReuseIdentifier: "Cell3")
        collectionView.register(Page4CollectionViewCell.self, forCellWithReuseIdentifier: "Cell4")
        collectionView.register(Page4CollectionViewCell.self, forCellWithReuseIdentifier: "Cell5")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(imgBg)
        self.view.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: imgBg)
        self.view.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: imgBg)
        
        /*if let windown = UIApplication.shared.keyWindow {
            windown.addSubview(viewAlert)
            viewAlert.showAlert()
            windown.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: viewAlert)
            windown.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: viewAlert)
        }*/
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.magenta
        setNavi()
        setupViewMenu()
        setupViewBg()
        setupMenuBar()
        setupCollectionViewMain()
    }
    
    func setNavi(){
        let viewTitle:UIView = {
            let vi = UIView()
            vi.backgroundColor = UIColor.white
            return vi
        }()
        
        let lblTitle:UILabel = {
            let lb = UILabel()
            lb.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        viewTitle.addSubview(lblTitle)
        viewTitle.addConstrainWithVisualFormat(VSFormat: "V:|[v0]|", views: lblTitle)
        viewTitle.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: lblTitle)

        lblTitle.text = "Home"
        
        navigationItem.titleView = viewTitle
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.menuAction))
        let searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeViewController.searchAction))
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.rightBarButtonItem = searchButton
    }
    
    func menuAction(){
        print("menu")
        //var fMain : CGRect = self.viewBg.frame
        //fMain.origin.x = UIScreen.main.bounds.width - 80;

        //let tranform = CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
        //let tranform = CATransform3DRotate(CATransform3DIdentity, CGFloat(250), 10, 100, 0)
        //let tranform = CATransform3DScale(CATransform3DIdentity, 1, 0.7, 1)
        if self.isMenu == false {
            UIView.animate(withDuration: 0.3, animations: { 
                 self.viewBg.frame.origin.x = UIScreen.main.bounds.width - 50
                }, completion: { (true) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.viewBg.frame.origin.x = UIScreen.main.bounds.width - 120
                        }, completion: { (true) in
                            UIView.animate(withDuration: 0.3, animations: {
                                self.viewBg.frame.origin.x = UIScreen.main.bounds.width - 80
                            })
                    })
            })
//            UIView.animate(withDuration: 0.5) {
//                self.viewBg.frame.origin.x = UIScreen.main.bounds.width - 20
//                self.viewBg.layer.transform = tranform
//            }
            /*UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { () -> Void in
                let layerTemp : CALayer = (self.viewBg.layer)
                layerTemp.zPosition = 1000
                var tRotate : CATransform3D = CATransform3DIdentity
                tRotate.m34 = 1.0/(-500)
                let aXpos: CGFloat = CGFloat(-20.0*(M_PI/180))
                tRotate = CATransform3DRotate(tRotate,aXpos, 0, 1, 0)
                var tScale : CATransform3D = CATransform3DIdentity
                tScale.m34 = 1.0/(-500)
                tScale = CATransform3DScale(tScale, 0.8, 0.8, 1.0);
                layerTemp.transform = CATransform3DConcat(tScale, tRotate)
                
                //self.viewBg.frame = fMain
                
                self.viewBg.frame.origin.x = UIScreen.main.bounds.width - 120
                }) { (finished: Bool) -> Void in
            }*/
            self.isMenu = true
        }else{
            UIView.animate(withDuration: 0.5) {
                self.viewBg.frame.origin.x = 0
                //self.viewBg.layer.transform = CATransform3DIdentity
            }
           /* UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { () -> Void in
                self.viewBg.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                let layerTemp : CALayer = self.viewBg.layer
                layerTemp.zPosition = 1000
                var tRotate : CATransform3D = CATransform3DIdentity
                tRotate.m34 = 1.0/(-500)
                let aXpos: CGFloat = CGFloat(0.0*(M_PI/180))
                tRotate = CATransform3DRotate(tRotate,aXpos, 0, 1, 0)
                layerTemp.transform = tRotate
                var tScale : CATransform3D = CATransform3DIdentity
                tScale.m34 = 1.0/(-500)
                tScale = CATransform3DScale(tScale,1.0, 1.0, 1.0);
                layerTemp.transform = tScale;
                layerTemp.transform = CATransform3DConcat(tRotate, tScale)
                layerTemp.transform = CATransform3DConcat(tScale, tRotate)
                self.viewBg.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
            }) { (finished: Bool) -> Void in
            }*/
            self.isMenu = false
        }
    }
    
    func searchAction(){
        print("search")
    }
    
    func setupViewBg(){
        self.view.addSubview(viewBg)
        viewBg.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        viewBg.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewBg.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewBg.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupViewMenu(){
        self.view.addSubview(viewMenu)
        viewMenu.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        viewMenu.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 40).isActive = true
        self.view.addConstrainWithVisualFormat(VSFormat: "H:|[v0]-80-|", views: viewMenu)
    }

    func setupCollectionViewMain(){
        viewBg.addSubview(myCollectionView)
        
        automaticallyAdjustsScrollViewInsets = false
        myCollectionView.topAnchor.constraint(equalTo: viewBg.topAnchor, constant: 0).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: menuBar.topAnchor, constant: 0).isActive = true
        viewBg.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|", views: myCollectionView)
    }
    
    func setupMenuBar(){
        menuBar.collMenuBar.delegate = self
        menuBar.collMenuBar.selectItem(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.left)
        
        viewBg.addSubview(menuBar)
        viewBg.addConstrainWithVisualFormat(VSFormat: "H:|[v0]|"   , views: menuBar)
        viewBg.addConstrainWithVisualFormat(VSFormat: "V:[v0(50)]|", views: menuBar)
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
        case "Cell4":
            cell as! Page4CollectionViewCell

        default:
            cell as! Page5CollectionViewCell
        }*/
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == myCollectionView {
            cell.alpha = 0.0
            UIView.animate(withDuration: 1) {
                cell.alpha = 1.0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case myCollectionView:
            print("aa")
        default:
            myCollectionView.selectItem(at: IndexPath.init(row: indexPath.row, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.left)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == myCollectionView {
            let index:Int = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
            menuBar.collMenuBar.selectItem(at: IndexPath.init(row: index, section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.right)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case myCollectionView:
            return CGSize(width: view.frame.width , height: viewBg.frame.height)
        case menuBar.collMenuBar:
            return CGSize(width: menuBar.frame.size.width / CGFloat(self.arrIdCell.count), height: menuBar.frame.size.height)
        default:
            return CGSize.zero
        }
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



