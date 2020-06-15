//
//  CitiesVC.swift
//  SunAndSet
//
//  Created by User on 7/16/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class CitiesVC: UIViewController,UITableViewDataSource,UITableViewDelegate ,UISearchBarDelegate {
   // @IBOutlet weak var tableViewHieght: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    var menuSelectedIndex = -1
    @IBOutlet weak var TxtSearch: UISearchBar!
    var AllCitiesData = [CitiesModel.City]()
    var filteredData: [String]!
    var IsSearching = false
    @IBOutlet weak var btnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         TxtSearch.showsCancelButton = false
        btnSave.layer.cornerRadius=22
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "LocationCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "LocationCell")
        getAllCitiesData()
        self.filteredData =   self.AllCitiesData.map {($0.name)}
      
    }
    var isLoading: Bool = false
    
    func getAllCitiesData(){
        guard !isLoading else { return }
        
        isLoading = true
        showLoading()
        AdsService.getCitiesData{ (error: String?,success: Bool,cats:[CitiesModel.City]?)in
            if let error = error{self.hideLoading()
                self.alertUser(title: "", message: error )
                return
                
            }
            print("success5")
            if let cate = cats{
                self.hideLoading()
                self.AllCitiesData.append(contentsOf: cate)
                print("/////////////////////////////////////////")
                print(cate)
                print("///////////////////////////////")
            }
            
            self.isLoading = false
            DispatchQueue.main.async {
                self.filteredData =   self.AllCitiesData.map {($0.name)}
                self.tableview.reloadData()
            }
            
        }}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if IsSearching == false{
        return   AllCitiesData.count  }
        else{return   filteredData.count }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
          //  tableViewHieght.constant = CGFloat( AllCitiesData.count*57)
        }
        
       
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
       cell.ImageCheckd.isHidden=true
        if menuSelectedIndex == indexPath.row{
            cell.ImageCheckd.isHidden=false
            cell.lblName.textColor = .red

        }else{
          cell.ImageCheckd.isHidden=true
             cell.lblName.textColor = .black
        }
        if IsSearching == false{
           cell.lblName.text = AllCitiesData[indexPath.row].name  }
        else{ cell.lblName.text = filteredData[indexPath.row] }
        
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      let Data =  self.AllCitiesData.map {($0.name)}
        filteredData = searchText.isEmpty ? Data : Data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        IsSearching = true
        print(filteredData.count,"count")
        tableview.reloadData()
    }
    @IBAction func BtnSave(_ sender: UIButton) {
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      menuSelectedIndex = indexPath.row
        tableView.reloadData()
        
}
    
}
