//
//  MainViewController.swift
//  SunAndSet
//
//  Created by User on 6/24/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width:200, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
 SetBarButtonSearch()
        // Do any additional setup after loading the view.
    }

    @objc func customizeSearchBar(){
        searchBar.placeholder = "search here"
        //searchBar.showsCancelButton = true
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.titleView = searchBar
        SetBarButtonBack()
    }
    func SetBarButtonSearch()
    {
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "search_nav"), for: UIControlState())
        btnLeftMenu.addTarget(self, action: #selector(customizeSearchBar), for: UIControlEvents.touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    func SetBarButtonBack()
    {
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back_nav"), for: UIControlState())
        btnLeftMenu.addTarget(self, action: #selector(searchBarCancelButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    @objc func searchBarCancelButtonClicked(_ sender: UIBarButtonItem) {
        // Stop doing the search stuff
        // and clear the text in the search bar
        searchBar.text = ""
        self.navigationItem.titleView = nil
        // Hide the cancel button
        searchBar.showsCancelButton = false
        SetBarButtonSearch()
        self.navigationItem.leftBarButtonItem=nil
        // You could also change the position, frame etc of the searchBar
    }

}
