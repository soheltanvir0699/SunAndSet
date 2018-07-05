//
//  FavoriteVC.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class FavoriteVC: MainViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableview: UITableView!
    var FavouriteData = [advertiseModel.Cate]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title="Favourites"
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "ProductCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "ProductCell")
        if  UsersDefault.userIsLogged == true{
            getFavouriteByUserData()
        }
    }
    func showEmptyFavouriteView(){
        _ = UINib.init(nibName: "favPlaceholder", bundle: nil)
        //self.view.register(nib, forCellReuseIdentifier: "SupViewConnectUs")
        let rootView = Bundle.main.loadNibNamed("NoAds", owner: self, options: nil)?[0] as? NoAds
        rootView?.LblResult.text = "No Favourites"
        rootView?.ImageNo.image = UIImage(named: "offersPlaceholder")
        if let aView = rootView {
            aView.tag = 100
            self.view.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
            aView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
            aView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
            aView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
            aView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
            
        }
    }
    var isLoading: Bool = false
    func getFavouriteByUserData(){
        guard !isLoading else { return }
        isLoading = true
        showLoading()
        FavouriteService.getFavouriteByUserId{ (error: String?,success: Bool,favs:[advertiseModel.Cate]?)in
            if let error = error{
                self.hideLoading()
                if error == "EmptyData"{
                    self.showEmptyFavouriteView()
                    
                }
                else{
                    self.alertUser(title: "", message: error )}
                return
                
            }
            print("success5")
            if let fav = favs{
                self.FavouriteData.append(contentsOf: fav)
                print("/////////////////////////////////////////")
                print(fav)
                print("///////////////////////////////")
            }
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.hideLoading()
                self.tableview.reloadData()
                
            }}
            
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return   FavouriteData.count  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.lblPrice.text = String(FavouriteData[indexPath.row].price)+" ₺"
        cell.ImagePro.addImage(withImage: FavouriteData[indexPath.row].category.image, andPlaceHolder: "Placeholder")
        cell.lblKind.text = "["+FavouriteData[indexPath.row].status+"]"
        cell.lblDetail.text = FavouriteData[indexPath.row].name
        cell.lblLocation.text = FavouriteData[indexPath.row].area.name+" , "+FavouriteData[indexPath.row].city.name
        //cell.btnFavorite.addTarget(self, action: #selector(btnFavouriteAction), for: .touchUpInside)
        cell.btnFavorite.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.DescripProVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! DescripProVC
        let  dest = FavouriteData[indexPath.row]
        destination.SingelItem = dest
        destination.title =  title
        // destination.SingelItemId=catPros[indexPath.row].id
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

