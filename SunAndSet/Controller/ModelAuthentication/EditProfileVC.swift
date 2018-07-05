//
//  EditProfileVC.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var BtnSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
  BtnSave.layer.cornerRadius=22
        // Do any additional setup after loading the view.
    }

    @IBAction func Btnsave(_ sender: UIButton) {
    }
    
    @IBAction func BtnChange(_ sender: UIButton) {
        RootView.toChangePasswordVC(withVC: self, title: "Change Password")
    }
    
}
