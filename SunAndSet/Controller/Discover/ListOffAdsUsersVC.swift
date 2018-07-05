//
//  ListOffAdsUsersVC.swift
//  SunAndSet
//
//  Created by User on 6/24/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class ListOffAdsUsersVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
@IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.tableFooterView = UIView()
        let nib = UINib.init(nibName: "ProductCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "ProductCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return   10  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.lblPrice.text = "300"+"₺"
        /*cell.imageIcon.image = iconArr[indexPath.row]*/
        cell.lblKind.text = "["+"Supcat"+"]"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let indexPath = collectionView.indexPathsForSelectedItems
        //let currentCell = tableView.cellForRow(at: indexPath) as! SupCatCell
        // let title =  currentCell.lblNameSupCat.text
        RootView.toDescripProVC(withVC: self, title: "")
    }

}
