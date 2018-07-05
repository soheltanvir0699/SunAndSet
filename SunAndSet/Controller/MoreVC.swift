//
//  MoreVC.swift
//  SunAndSet
//
//  Created by User on 6/19/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class MoreVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
@IBOutlet weak var tableview: UITableView!
    var SectionsLogin = ["My Info","Control","Other"]
    var SectionsNotLogin = ["Join Sun & Sat","Already have an account?","Other"]
    var TitleNotLogin = [["Create New Accoun"],["Login"],["About App","Contact Us","Terms of Service","About Developers"]]
    var TitleLogin = [["omar"],["My Ads"],["About App","Contact Us","Terms of Service","About Developers","Log Out"]]
   
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "More"
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "SupCat", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "SupCatCell")
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor(red:0.51, green:0.51, blue:0.51, alpha:1.0)
            headerTitle.textLabel?.font=UIFont.OpenSansSemiBold(size: 15)
            headerTitle.backgroundView?.backgroundColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        }
    }
    /*
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
     header.imgIcon.image = iconArr[section]
     return header
     }*/
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if UsersDefault.userIsLogged==true{
            return SectionsLogin[section]}
        else{return SectionsNotLogin[section]}
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 100
     }*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if UsersDefault.userIsLogged==true{

        return  self.TitleLogin[section].count
        }
        else{return TitleNotLogin[section].count
            
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "SupCatCell", for: indexPath) as! SupCatCell
      
       
        
        if UsersDefault.userIsLogged==true{
            if indexPath.section == 0{
                cell.ImageIcone.image = UIImage(named: "edit_more")
            }
            cell.lblNameSupCat.text = TitleLogin[indexPath.section][indexPath.row]
            
        }
        else{
         cell.lblNameSupCat.text = TitleNotLogin[indexPath.section][indexPath.row]
            }
        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

