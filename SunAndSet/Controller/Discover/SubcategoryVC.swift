//
//  SubcategoryVC.swift
//  SunAndSet
//
//  Created by User on 6/20/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class SubcategoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    
    @IBOutlet weak var tableViewHieght: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    var  CatId:Int?
    var SupCatData = [SupCatModel.Cate]()
    override func viewDidLoad() {
        super.viewDidLoad()
tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "SupCat", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "SupCatCell")
        getSupCatData()
        // Do any additional setup after loading the view.
    }
    var isLoading: Bool = false
    func getSupCatData(){
        guard !isLoading else { return }
        print(CatId ?? 3,"CatId")
        isLoading = true
        showLoading()
        CategoeryService.getSupCatData(CatId: CatId!){ (error: String?,success: Bool,supcats:[SupCatModel.Cate]?)in
            if let error = error{self.hideLoading()
                self.alertUser(title: "", message: error )
                return
                
            }
           
            print("success5")
            guard let supcat = supcats else { print("Hussien")
                
                self.alertUser(title: "", message: "ThisCateEmpty" )
                return
                
            }
                
                self.SupCatData.append(contentsOf: supcat)
                
                
                print("/////////////////////////////////////////")
                print(supcat)
                print("///////////////////////////////")
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.hideLoading()
                
                self.tableview.reloadData()
              
            }
            
        }}
    override func viewDidAppear(_ animated: Bool) {
        // tableViewHieght.constant=400
    }
//    override func viewWillAppear(_ animated: Bool) {
//        tableViewHieght.constant=self.tableview.contentSize.height
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return   SupCatData.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
            tableViewHieght.constant = CGFloat(60*SupCatData.count)
            
        }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "SupCatCell", for: indexPath) as! SupCatCell
        
        /*cell.imageIcon.image = iconArr[indexPath.row]*/
        cell.lblNameSupCat.text = SupCatData[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if navigationItem.title=="Create Ad"{
            RootView.toChoosePhotoVC(withVC: self, title: "Create Ad")
        }
        else{
        //let indexPath = collectionView.indexPathsForSelectedItems
        let currentCell = tableView.cellForRow(at: indexPath) as! SupCatCell
        let title =  currentCell.lblNameSupCat.text
       let catid = SupCatData[indexPath.row].id
            RootView.toProductVC(withVC: self, title: title!,SupCat:catid )}
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
