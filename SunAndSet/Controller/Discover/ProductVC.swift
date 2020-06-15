//
//  ProductVC.swift
//  SunAndSet
//
//  Created by User on 6/21/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
var ResultString:String?
import ImageSlideshow
class ProductVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var HieghtOfTableView: NSLayoutConstraint!
     @IBOutlet weak var ViewSliderBanner: ImageSlideshow!
    var  SupCatId:Int?
    
    var SliderData = [advertiseModel.slider]()
    var CatProData = [advertiseModel.Cate]()
    var IndexSlectedBanner:Int = -1
@IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "ProductCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "ProductCell")
        CustomeImageSlideshow()
        // source Sup categorey
        getProByCatIDData()
    }
    var isLoading: Bool = false
    func getProByCatIDData(){
        guard !isLoading else { return }
        isLoading = true
        showLoading()
        AdsService.getProByCatID(Id: SupCatId!){ (error: String?,success: Bool,catpros:[advertiseModel.Cate]?,sliders:[advertiseModel.slider]?)in
            if let error = error{self.hideLoading()
                self.alertUser(title: "", message: error )
                return
                
            }
            print("success5")
            if let catpro = catpros{
                self.CatProData.append(contentsOf: catpro)
            print("/////////////////////////////////////////")
            print(catpro)
            print("///////////////////////////////")
            }
            if  let slid = sliders{
                self.SliderData = slid
                }
            self.isLoading = false
            DispatchQueue.main.async {
                self.hideLoading()
                 self.CustomeImageSlideshow()
                self.tableview.reloadData()
                
            }
            
        }}
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
            print("current page:", page)
        }
        var inputs = [SDWebImageSource]()
        print(self.SliderData.map({($0.image)}),"Array")
        for imageString in self.SliderData.map({($0.image)}) {
            let input = SDWebImageSource.init(urlString: imageString, placeholder: #imageLiteral(resourceName: "Placeholder"))
            inputs.append(input!)
        }
        self.ViewSliderBanner.setImageInputs(inputs)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSliderBanner))
        self.ViewSliderBanner.addGestureRecognizer(recognizer)
    }
    @objc func didTapSliderBanner() {
        ViewSliderBanner.presentFullScreenController(from: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return   CatProData.count  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
            HieghtOfTableView.constant = CGFloat(320*CatProData.count)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.lblPrice.text = String(CatProData[indexPath.row].price)+" ₺"
        cell.ImagePro.addImage(withImage: CatProData[indexPath.row].category.image, andPlaceHolder: "Placeholder")
        print(CatProData[indexPath.row].category.image!,"image")
          cell.lblKind.text = "["+CatProData[indexPath.row].status+"]"
         cell.lblDetail.text = CatProData[indexPath.row].name
        cell.lblLocation.text = CatProData[indexPath.row].area.name+" , "+CatProData[indexPath.row].city.name
        cell.btnFavorite.addTarget(self, action: #selector(btnFavouriteAction), for: .touchUpInside)
        cell.btnFavorite.tag = indexPath.row
        
        return cell
    }
    @objc func btnFavouriteAction(sender: UIButton){
        let buttonTag = sender.tag
         let IdPro = CatProData[buttonTag].id
        if  UsersDefault.userIsLogged==false
        {
        print(IdPro)
        if  Defualts.insertPro(id:IdPro){
            print("omaerf")
            sender.setImage(UIImage(named: "savedCard"), for: UIControlState())

        }
        else{
            print("omaerff")
            Defualts.deletePro(ID: IdPro)
            sender.setImage(UIImage(named: "saveCard"), for: UIControlState())
            }}
            //logined
        else{showLoading()
            FavouriteService.AddFavourite(ProductId: IdPro) { (error: String?, success: Bool) in
            if success {
                self.hideLoading()
                if ResultString == "favorited"{
                    sender.setImage(UIImage(named: "savedCard"), for: UIControlState())
                }
                else{ sender.setImage(UIImage(named: "saveCard"), for: UIControlState())}
              
            }
            else  {self.hideLoading()
                print(Error.self)
                self.alertUser(title: "", message: error! )
            }
            
            }
            
            
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.DescripProVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! DescripProVC
       let  dest = CatProData[indexPath.row]
        destination.SingelItem = dest
        destination.title =  title
        // destination.SingelItemId=catPros[indexPath.row].id
        self.navigationController?.pushViewController(destination, animated: true)
       // RootView.toDescripProVC(withVC: self, title: "")
    }

}
