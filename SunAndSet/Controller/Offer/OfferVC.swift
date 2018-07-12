//
//  OfferVC.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class OfferVC: MainViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
     var menuSelectedIndex = 0
    var CatId = -1
     var lastpage:OffersModel?
    var AllCateData = [OfferModel.Cate]()
      var OfferData = [OffersModel.Offers]()
    var selectedOfferImagesFrame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
@IBOutlet weak var CollectionViewCat: UICollectionView!
    @IBOutlet weak var CollectionViewOffer: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCatData()
        self.navigationItem.title="Offers"
     
        
        }
     var isLoading: Bool = false
    func getAllCatData(){
        guard !isLoading else { return }
        
        isLoading = true
        showLoading()
        CategoeryService.getAllCatData{ (error: String?,success: Bool,cats:[OfferModel.Cate]?)in
            if let error = error{self.hideLoading()
                self.alertUser(title: "", message: error )
                return
                
            }
            print("success5")
            if let cate = cats{
                self.CatId = cate[0].id
                self.AllCateData.append(contentsOf: cate)
                self.getOfferData()
                
                print("/////////////////////////////////////////")
                print(cate)
                print("///////////////////////////////")
                
                
            }
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.CollectionViewCat.reloadData()
            }
            
        }}
    func showEmptyOfferView(){
        _ = UINib.init(nibName: "NoAds", bundle: nil)
        //self.view.register(nib, forCellReuseIdentifier: "SupViewConnectUs")
        let rootView = Bundle.main.loadNibNamed("NoAds", owner: self, options: nil)?[0] as? NoAds
        rootView?.LblResult.text = "No Offers"
        rootView?.ImageNo.image = UIImage(named: "offersPlaceholder")
        if let aView = rootView {
            aView.tag = 100
            self.view.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
            aView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
            aView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            aView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            aView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
           
        }
    }
   var currentPage = 1
    func getOfferData(){
       showLoading()
        OffersService.getOffersByCatData(currentPage:1,CatId: CatId){ (error: String?,success: Bool,offers:[OffersModel.Offers]?,lastPage)in
            if let error = error{
                self.hideLoading()
                if error == "EmptyData"{
                    self.showEmptyOfferView()
               
                    }
                else{
             self.alertUser(title: "", message: error )
                    
                }
                 return
            }
            print("success5")
            self.CollectionViewOffer.dataSource=self
            if let offer = offers{
            self.OfferData.append(contentsOf: offer)
            }
            if let last = lastPage{
                self.lastpage = last
            }
            DispatchQueue.main.async {
                self.hideLoading()
                
            self.CollectionViewOffer.reloadData()
                
            }
            
        }}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView==CollectionViewCat{
            return AllCateData.count
        }
        else{
             return OfferData.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if collectionView==CollectionViewCat{
return setupMenuCateOfferCollectionView(collectionView, cellForItemAt: indexPath)
            
            
         }
         else{
            let cell:OfferCell=collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCell
       
            cell.ImageOffer.addImage(withImage: OfferData[indexPath.row].offer_image, andPlaceHolder: "Placeholder")
            
            return cell
        }
       
    }
    func setupMenuCateOfferCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:MenuOfferCatCell=collectionView.dequeueReusableCell(withReuseIdentifier: "MenuOfferCatCell", for: indexPath) as! MenuOfferCatCell
        if menuSelectedIndex == indexPath.row{
            cell.SelectedView.backgroundColor = UIColor.black
           cell.LblCatOffer.textColor = UIColor.black
            
        }else{
            cell.SelectedView.backgroundColor = UIColor.clear
            cell.LblCatOffer.textColor = UIColor.darkGray
        }
        cell.LblCatOffer.text=AllCateData[indexPath.row].name
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView==CollectionViewCat{
            
            CollectionViewOffer.dataSource=nil
            CollectionViewOffer.reloadData()
            //Remove Sup view
            for subview in self.view.subviews {
            if (subview.tag == 100) {
                print("Hussnien")
                subview.removeFromSuperview()
            }
        }
        menuSelectedIndex = indexPath.row
        print("menuCategorySelectedIndex: \(menuSelectedIndex)")
        CollectionViewCat.reloadData()
            self.CatId = AllCateData[indexPath.row].id
            getOfferData()
        }
        else{
            guard OfferData[indexPath.row].offer_image != "Placeholder" else { return }
            let selectedCell = collectionView.cellForItem(at: indexPath) as! OfferCell
            OfferImageTapped(selectedCell.ImageOffer)
            
        }
        
        
       
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView==CollectionViewOffer{
        let count = self.OfferData.count
        if indexPath.row == count
        {print(count,"count")
            self.currentPage += 1
            self.getOfferData()
            }}
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == CollectionViewCat{
            let name = AllCateData[indexPath.row].name
            let width =  name.width(withConstrainedHeight: 16, font: UIFont.OpenSansRegular(size: 16)) + 16
            return CGSize(width: width, height: 48)
            
        }else if collectionView == CollectionViewOffer{
            let  ScreanWidth = UIScreen.main.bounds.size.width
            var width = (ScreanWidth-36)/2
                 width = width > 200 ? 200: width
                   return CGSize.init(width: width , height:200)
            
        }else{
            return CGSize.zero
        }
    }
    @IBAction func OfferImageTapped(_ sender: UIImageView) {
        
        let imageView = sender
        selectedOfferImagesFrame = imageView.frame
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = selectedOfferImagesFrame
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        //            self.view.addSubview(newImageView)
        UIApplication.shared.keyWindow?.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            newImageView.frame = UIScreen.main.bounds
        }
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        UIView.animate(withDuration: 0.2, animations: {
            let imageView = sender.view as! UIImageView
            imageView.frame = self.selectedOfferImagesFrame
        }) { (success) in
            if success{
                sender.view?.removeFromSuperview()
            }
        }
    }
}
        




