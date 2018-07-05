//
//  HomeVC.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import ImageSlideshow
import Kingfisher
import SDWebImage
class HomeVC: MainViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var CategoriesData = [HomeModel.Cate]()
    var SliderData = [HomeModel.image]()
     @IBOutlet weak var ViewSliderBanner: ImageSlideshow!
     @IBOutlet weak var CollectionViewCat: UICollectionView!
    @IBOutlet weak var HieghtOfCollectionCat: NSLayoutConstraint!
  // let localSourceImageBanner = [ImageSource(imageString: "home_glyph")!, ImageSource(imageString: "fav_glyph")!, ImageSource(imageString: "fav_glyph")!]
    var IndexSlectedBanner:Int = -1
   
    override func viewDidLoad() {
        super.viewDidLoad()
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      self.navigationItem.title = "Discover"
        getHomeData()
       // CustomeImageSlideshow()
//       // ViewSliderBanner.setImageInputs([
//            ImageSource(image: UIImage.addi])
      
        // Do any additional setup after loading the view.
    }
    var isLoading: Bool = false
    func getHomeData(){
        guard !isLoading else { return }
        
        isLoading = true
        showLoading()
        CategoeryService.getHomeData{ (error: String?,success: Bool,cats:[HomeModel.Cate]?,sliders:[HomeModel.image]?)in
            if let error = error{self.hideLoading()
                self.alertUser(title: "", message: error )
                return
                
            }
            print("success5")
            if let cate = cats{
               
                self.CategoriesData.append(contentsOf: cate)
               
               
                print("/////////////////////////////////////////")
                print(cate)
                print("///////////////////////////////")
               
                
            }
            if  let slid = sliders{
                self.SliderData.append(contentsOf: slid)
                
            }
             self.isLoading = false
            DispatchQueue.main.async {
                self.hideLoading()
                
                self.CollectionViewCat.reloadData()
                self.CustomeImageSlideshow()
            }
            
        }}
        
        
    override func viewDidAppear(_ animated: Bool) {
        //HieghtOfCollectionSamePro
        print("as")
        //HieghtOfCollectionCat.constant = 1000
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        HieghtOfCollectionCat.constant = self.CollectionViewCat.contentSize.height
//    }
//    override func viewDidLayoutSubviews() {
//         HieghtOfCollectionCat.constant = self.CollectionViewCat.contentSize.height
//    }
//    override func viewWillAppear(_ animated: Bool) {
//          HieghtOfCollectionCat.constant = self.CollectionViewCat.contentSize.height
//    }
//    override func viewWillLayoutSubviews() {
//        HieghtOfCollectionCat.constant = self.CollectionViewCat.contentSize.height
//    }
    //view
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
        print(self.SliderData.map({($0.image)}),"Array")
        for imageString in self.SliderData.map({($0.image)}) {
            let input = SDWebImageSource.init(urlString: imageString!, placeholder: #imageLiteral(resourceName: "Placeholder"))
            inputs.append(input!)
        }
        
        self.ViewSliderBanner.setImageInputs(inputs)
               // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
       // self.ViewSliderBanner.setImageInputs(self.SliderData.map {($0.image)})
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSliderBanner))
        self.ViewSliderBanner.addGestureRecognizer(recognizer)
        
    }
    @objc func didTapSliderBanner() {
         ViewSliderBanner.presentFullScreenController(from: self)
//        let destination = storyboard?.instantiateViewController(withIdentifier: "VCProducts") as! VCProducts
//        destination.title = (String(IndexSlectedBanner))
//        navigationController?.pushViewController(destination, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(CategoriesData.count,"CategoriesData.count")
        return CategoriesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row==0{
             HieghtOfCollectionCat.constant = self.CollectionViewCat.contentSize.height
        }
        let cell:CatCell=collectionView.dequeueReusableCell(withReuseIdentifier: "CatCell", for: indexPath) as! CatCell
        cell.lblCat.text = CategoriesData[indexPath.row].name
        cell.imageCat.addImage(withImage: CategoriesData[indexPath.row].image, andPlaceHolder: "Placeholder")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {let  ScreanWidth = UIScreen.main.bounds.size.width
        let width = (ScreanWidth-40)/3
       // width = width > 200 ? 200: width
        return CGSize.init(width: width , height:184)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath) as! CatCell
        let title =  currentCell.lblCat.text!
        let  CatId = CategoriesData[indexPath.row].id
        RootView.toSubcategoryVC(withVC: self, title: title,CatId:CatId)
       
    }
        
        
        
    
    
    

    

}
