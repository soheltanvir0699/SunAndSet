//
//  DescripProVC.swift
//  SunAndSet
//
//  Created by User on 6/21/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import ImageSlideshow
import Kingfisher
import SDWebImage
class DescripProVC: UIViewController {
//    class MyButton: UIButton {
//        var action: (() -> Void)?}
     @IBOutlet weak var ViewSliderBanner: ImageSlideshow!
    var IndexSlectedBanner:Int = -1
    var  SingelItem:advertiseModel.Cate?
    @IBOutlet weak var lblNameOwner: UILabel!
    var btnRight: UIButton = UIButton()
    var isLoved :Bool = false
    @IBOutlet weak var txtDes: UITextView!
    @IBOutlet weak var lblNumViewier: UILabel!
    @IBOutlet weak var lblDescrip: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDesOwner: UILabel!
    @IBOutlet weak var BtnNameOwener: UIButton!
    @IBOutlet weak var ImageOwener: UIImageView!
    @IBOutlet weak var ViewReport: UIView!
    @IBOutlet weak var lblCat: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if SingelItem?.user_id != SingelItem?.user?.id{
            if SingelItem?.isFave==false{
                // Not Favorite
                btnRight.setImage(UIImage(named: "saveCard"), for: UIControlState())
                
            }
                 //  Favorited
            else{
                btnRight.setImage(UIImage(named: "savedCard"), for: UIControlState())
            }
            btnRight.addTarget(self, action: #selector(DescripProVC.LoveAction), for: UIControlEvents.touchUpInside)
            btnRight.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            let barButton = UIBarButtonItem(customView: btnRight)
            self.navigationItem.rightBarButtonItem = barButton
           
        }
            // user onwer ADS
        else{
            btnRight.setImage(UIImage(named: "edit"), for: UIControlState())
        btnRight.addTarget(self, action: #selector(DescripProVC.EditADSAction), for: UIControlEvents.touchUpInside)
        btnRight.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        let barButton = UIBarButtonItem(customView: btnRight)
        self.navigationItem.rightBarButtonItem = barButton
            ViewReport.isHidden=true
            
        }
       // fill Data
        // handle optinalValue
        if let price = SingelItem?.price
        {lblPrice.text = String(price) + " ₺"
        }
        if let priNumViewerce = SingelItem?.view_count
        { lblNumViewier.text = String(priNumViewerce)
        }
        
        lblCat.text = (SingelItem?.category.name)! + "." + (SingelItem?.cat_parent_name.name)!
         txtDes.text = SingelItem?.description
        lblNameOwner.text = SingelItem?.user?.name
        if let DesOwner = SingelItem?.created_at
        { lblDesOwner.text = "Posted this product on " + DesOwner
        }
        else{lblDesOwner.text = "Posted this product on "}
        lblDescrip.text = SingelItem?.name
       ImageOwener.addImage(withImage: nil, andPlaceHolder: "Placeholder")
        print(SingelItem!,"SingelItem")
        lblLocation.text = (SingelItem?.area.name)!+" , " + (SingelItem?.city.name)!
        NotificationCenter.default.addObserver(self, selector: #selector(self.dismissSupView), name: NSNotification.Name(rawValue:"dismissSupView"), object: nil)
       CustomeImageSlideshow()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissSupView))
        view.addGestureRecognizer(tap)
        navigationController?.navigationBar.addGestureRecognizer(tap)
    }
    func CustomeImageSlideshow(){
        ViewSliderBanner.backgroundColor = UIColor.white
        ViewSliderBanner.slideshowInterval = 5.0
        ViewSliderBanner.pageControlPosition = PageControlPosition.insideScrollView
        ViewSliderBanner.pageControl.currentPageIndicatorTintColor = UIColor(red:0.89, green:0.27, blue:0.53, alpha:1.0)
        ViewSliderBanner.pageControl.pageIndicatorTintColor = UIColor.gray
        ViewSliderBanner.contentScaleMode = UIViewContentMode.scaleAspectFill
        ViewSliderBanner.activityIndicator = DefaultActivityIndicator()
        ViewSliderBanner.currentPageChanged = { page in
            self.IndexSlectedBanner=page
            //print("current page:", page)
        }
        var inputs = [SDWebImageSource]()
       
        for imageString in (self.SingelItem?.images.map({($0.image)}))! {
            let input = SDWebImageSource.init(urlString: imageString!, placeholder: #imageLiteral(resourceName: "Placeholder"))
            inputs.append(input!)
        }
        
        self.ViewSliderBanner.setImageInputs(inputs)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSliderBanner))
        self.ViewSliderBanner.addGestureRecognizer(recognizer)
        
    }
    @objc func didTapSliderBanner() {
        ViewSliderBanner.presentFullScreenController(from: self)
    }
    func GotoEditView(){
        
        
    }
    @objc func dismissSupView() {
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
        self.tabBarController?.tabBar.isHidden=false
    }
   
    @objc func LoveAction(){
        showLoading()
        FavouriteService.AddFavourite(ProductId:  (SingelItem?.id)!) { (error: String?, success: Bool) in
            if success {
                self.hideLoading()
                if ResultString == "favorited"{
                    self.btnRight.setImage(UIImage(named: "savedCard"), for: UIControlState())
                }
                else{ self.btnRight.setImage(UIImage(named: "saveCard"), for: UIControlState())}
                
            }
            else  {self.hideLoading()
                print(Error.self)
                self.alertUser(title: "", message: error! )
            }
            
        }
        
        
    }
    @objc func EditADSAction(){
       
            
        print("GoToEditProfile")
        
        
    }
    @IBAction func BtnGotoOwenerDetails(_ sender: UIButton) {
        
        let userId = SingelItem?.user?.id
        let userName = SingelItem?.user?.name
        RootView.toListOffAdsUsersVC(withVC: self, title: userName!, UserID: userId!)
       
        
       
    }
    
    @IBAction func BtnReport(_ sender: Any) {
        print("omar")
        _ = UINib.init(nibName: "PopUpStatus", bundle: nil)
        //self.view.register(nib, forCellReuseIdentifier: "SupViewConnectUs")
        let rootView = Bundle.main.loadNibNamed("PopUpStatus", owner: self, options: nil)?[0] as? PopUpStatus
        rootView?.BtnClose.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
        if let aView = rootView {
            aView.tag = 100
            self.navigationController?.view.addSubview(aView)
            self.tabBarController?.tabBar.isHidden=true
        }
       
    }
    
    @IBAction func BtnConectUs(_ sender: Any) {
        print("omar")
        let rootView = Bundle.main.loadNibNamed("SupViewConnectUs", owner: self, options: nil)?[0] as? SupViewConnectUs
        rootView?.lblName.text = SingelItem?.user?.name
        if let PhomeNum = SingelItem?.user?.mobile
        { rootView?.lblPhomeNum.text = String(PhomeNum)
        }
        rootView?.BtnCall.addTarget(self, action: #selector(BtnCall), for: .touchUpInside)
        rootView?.BtnMessage.addTarget(self, action: #selector(BtnMessage), for: .touchUpInside)
        if let aView = rootView {
           aView.tag = 100
            print("nnnnn")
            guard let navView = self.navigationController?.view else {return}
            navView.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
            aView.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
            aView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
             aView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
             aView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
            self.tabBarController?.tabBar.isHidden=true
        }
    }
    @IBAction func BtnCall(_ sender: Any) {
        guard let PhomeNum = SingelItem?.user?.mobile else{return}
        let Num = String(PhomeNum)
        if let url = URL(string: "tel://\(Num)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }    }
    @IBAction func BtnMessage(_ sender: Any) {
        print("om")
        UIApplication.shared.open(URL(string: "01155906980")!, options: [:], completionHandler: nil)
        
    }
}
