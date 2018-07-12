//
//  CreateAdVC.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
var CategoryName = ""
var SupCategoryName = ""
class CreateAdVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableViewHieght: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    var AllCateData = [OfferModel.Cate]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//RootView.toLoginVC(withVC: self, title: "Login")
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if UsersDefault.userIsLogged==true{
        self.navigationItem.title = "Create Ad"
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "SupCat", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "SupCatCell")
            getAllCatData()}
}
    override func viewWillAppear(_ animated: Bool) {
        //user Not login
        if  UsersDefault.userIsLogged==false{
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(GotoHome))
            RootView.toNotLoginVC(withVC: self)
    }
        
    }
     @objc func GotoHome(){
        print("om3")
         self.tabBarController?.selectedIndex=1
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
                self.hideLoading()
                self.AllCateData.append(contentsOf: cate)
                print("/////////////////////////////////////////")
                print(cate)
                print("///////////////////////////////")
            }
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
        }}
    override func viewDidAppear(_ animated: Bool) {
        tableViewHieght.constant=600
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        tableViewHieght.constant=self.tableview.contentSize.height
    //    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return   AllCateData.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = Bundle.main.loadNibNamed("SupCatCell", owner: self, options: nil)?.first as! SupCatCell1
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupCatCell", for: indexPath) as! SupCatCell
        
        /*cell.imageIcon.image = iconArr[indexPath.row]*/
        cell.lblNameSupCat.text = AllCateData[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let indexPath = collectionView.indexPathsForSelectedItems
        let CatId = AllCateData[indexPath.row].id
        CategoryName=AllCateData[indexPath.row].name
         RootView.toSubcategoryVC(withVC: self, title: "Create Ad",CatId:CatId)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
