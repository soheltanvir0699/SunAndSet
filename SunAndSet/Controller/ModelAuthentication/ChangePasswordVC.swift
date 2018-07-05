//
//  ChangePasswordVC.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class ChangePasswordVC: UIViewController {
    
    @IBOutlet weak var BtnChange: UIButton!
    @IBOutlet weak var txtPassOld: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPassNew: SkyFloatingLabelTextField!
     var iconClickOld : Bool = true
     var iconClickNew : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnChange.layer.cornerRadius=22
        txtPassNew.tag=2
        txtPassOld.tag=1
         CustomizeShowPassword(txtPassOld)
        CustomizeShowPassword(txtPassOld)
        // Do any additional setup after loading the view.
    }

    func CustomizeShowPassword(_ textfiled:UITextField){
        let button = UIButton(type: .custom)
        button.setTitle("SHOW", for: .normal)
        button.setTitleColor(UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0) , for: .normal)
        button.titleLabel?.font =   UIFont.OpenSansRegular(size: 14)
        // button.backgroundColor = .red
        //button.setImage(UIImage(named: "edit"), for: .normal)
        // button.titleEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        button.frame = CGRect(x: CGFloat(textfiled.frame.size.width - 60), y: CGFloat(5), width: CGFloat(60), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.ShowPassword(_:)), for: .touchUpInside)
        
        textfiled.rightView = button
        textfiled.rightViewMode = .always
        //  txtPass.rightViewMode = .unlessEditing
   
    
        
    }
    
    @IBAction func ShowPassword(_ sender: UIButton) {
        if sender.tag == 2 {
        if(iconClickNew == true) {
            //txtPass.isSecureTextEntry
            txtPassNew.isSecureTextEntry = false
            iconClickNew = false
        } else {
            txtPassNew.isSecureTextEntry = true
            iconClickNew = true
            }}
        else{
            if(iconClickOld == true) {
                //txtPass.isSecureTextEntry
                txtPassOld.isSecureTextEntry = false
                iconClickOld = false
            } else {
                txtPassOld.isSecureTextEntry = true
                iconClickOld = true
            }
        }
            
        }
    }

