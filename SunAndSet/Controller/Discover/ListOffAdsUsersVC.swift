//
//  ListOffAdsUsersVC.swift
//  SunAndSet
//
//  Created by User on 6/24/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class ListOffAdsUsersVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
     var  UserId:Int?
    var CatProData = [advertiseModel.Cate]()
@IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "ProductCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "ProductCell")
        getProByUserIDData()
    }
    var isLoading: Bool = false
    func getProByUserIDData(){
        guard !isLoading else { return }
        isLoading = true
        showLoading()
        AdsService.getProByUserId(Id: UserId!){ (error: String?,success: Bool,catpros:[advertiseModel.Cate]?)in
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
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.hideLoading()
                self.tableview.reloadData()
                
            }
            
        }}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return   CatProData.count  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.lblPrice.text = String(CatProData[indexPath.row].price)+" ₺"
        cell.ImagePro.addImage(withImage: CatProData[indexPath.row].category.image, andPlaceHolder: "Placeholder")
        cell.lblKind.text = "["+CatProData[indexPath.row].status+"]"
        cell.lblDetail.text = CatProData[indexPath.row].name
        cell.lblLocation.text = CatProData[indexPath.row].area.name+" , "+CatProData[indexPath.row].city.name
        //cell.btnFavorite.addTarget(self, action: #selector(btnFavouriteAction), for: .touchUpInside)
        cell.btnFavorite.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.DescripProVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! DescripProVC
        let  dest = CatProData[indexPath.row]
        destination.SingelItem = dest
        destination.title =  title
       
        self.navigationController?.pushViewController(destination, animated: true)
       
    }

}
