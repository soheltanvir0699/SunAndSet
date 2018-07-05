//
//  NotLoginVC.swift
//  SunAndSet
//
//  Created by User on 6/27/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class NotLoginVC: UIViewController {
    @IBOutlet weak var BtnLogin: UIButton!
    @IBOutlet weak var BtnCreateNew: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
          BtnLogin.layer.cornerRadius=4
          BtnCreateNew.layer.cornerRadius=4
        BtnLogin.layer.borderWidth=2
        BtnLogin.layer.borderColor = UIColor.red.cgColor
       // BtnLogin.backgroundColor = .green
        navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.back(_:)))
        newBackButton.image = UIImage(named: "back_nav")
        navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(_ sender: UIBarButtonItem?) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        
        self.tabBarController?.selectedIndex=0
        navigationController?.popViewController(animated: true)
        
    }
         //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(GotoHome))
    

    @IBAction func Login(_ sender: UIButton) {
         RootView.toLoginVC(withVC: self, title: "Login")
    }
    @IBAction func SignUp(_ sender: UIButton) {
        RootView.toRegisterVC(withVC: self, title: "SignUP")
    }
    
}
