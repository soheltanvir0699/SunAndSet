//
//  RegisterVC.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class RegisterVC: UIViewController {
     var showPasswordButton = UIButton(type: .custom)
    @IBOutlet weak var txtPass: SkyFloatingLabelTextField!
    @IBOutlet weak var BtnSignUp: UIButton!
    @IBOutlet weak var txtEmail: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPhone: SkyFloatingLabelTextField!
    @IBOutlet weak var txtName: SkyFloatingLabelTextField!
    @IBOutlet weak var ViewNameError: UIView!
    @IBOutlet weak var ViewPhoneError: UIView!
    @IBOutlet weak var ViewEmailrror: UIView!
    @IBOutlet weak var ViewPassError: UIView!
    @IBOutlet weak var lblErrorName: UILabel!
    @IBOutlet weak var lblErrorPhone: UILabel!
    @IBOutlet weak var lblErrorEmail: UILabel!
    @IBOutlet weak var lblErrorPass: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnSignUp.layer.cornerRadius=22
        CustomizeShowPassword()
        ViewErrorStatus(IsHidden:true)
        // Do any additional setup after loading the view.
    }
    func CustomizeShowPassword(){
        showPasswordButton.setTitle("SHOW", for: .normal)
        showPasswordButton.setTitleColor(UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0), for: .normal)
        showPasswordButton.titleLabel?.font =   UIFont.OpenSansRegular(size: 14)
        showPasswordButton.frame = CGRect(x: CGFloat(txtPass.frame.size.width - 60), y: CGFloat(5), width: CGFloat(60), height: CGFloat(25))
        showPasswordButton.addTarget(self, action: #selector(self.ShowPassword(_:)), for: .touchUpInside)
        txtPass.rightView = showPasswordButton
        txtPass.rightViewMode = .always
        //  txtPass.rightViewMode = .unlessEditing
    }
    func ViewErrorStatus(IsHidden:Bool){
    ViewNameError.isHidden=IsHidden
    ViewEmailrror.isHidden=IsHidden
    ViewPassError.isHidden=IsHidden
    ViewPhoneError.isHidden=IsHidden
    }
    @IBAction func BtnSignUp(_ sender: UIButton) {
        self.ViewErrorStatus(IsHidden: true)
         guard let name = txtName.text?.trimmed, !name.isEmpty, let mobile = txtPhone.text?.trimmed, !mobile.isEmpty,let email = txtEmail.text, !email.isEmpty,  let password = txtPass.text, !password.isEmpty
        else  {
             alertUser(title: "", message: "please fill all the fields")
            return
            }
        guard password.count > 7 else {
            ViewPassError.isHidden=false
            lblErrorPass.text = "please make sure that the password is greater than 8 characters"
            return
        }
        
        guard !name.hasPrefix(" ") else {
            ViewNameError.isHidden=false
            lblErrorName.text = "Sorry your name cannot start with empty space"
           
            return
        }
        
        guard !mobile.contains(" ") else {
            ViewPhoneError.isHidden=false
            lblErrorPhone.text = "Sorry your mobile number cannot have an empty space"
            return
        }
        
        
        if (email.validateEmail()==false){
            ViewEmailrror.isHidden=false
            lblErrorEmail.text = "Sorry you Email not correct"
            return
        }
        guard name.count <= 50 else {
            ViewNameError.isHidden=false
            lblErrorName.text = "Sorry you name should be less than 50 characters"
            
            return
        }
        guard !password.contains(" ") else {
            ViewPassError.isHidden=false
            lblErrorPass.text = "Sorry your password cannot have an empty space"
            return
        }
         showLoading()
        AuthenticationService.Register(name: name, country_code: "+20", mobile: mobile, email:email, password:password) { (error: String?, success: Bool) in
            if success {
               
               self.hideLoading()
                print("omar555")
                self.alertUser(title: "", message: "sucess" )
               // self.cleartext()
            }
            else  {self.hideLoading()
                print(Error.self)
                self.alertUser(title: "", message: error! )
                //self.cleartext()
            }
            
        }
    }
    
    @IBAction func BtnGotoLogin(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ShowPassword(_ sender: Any) {
        
        if txtPass.isSecureTextEntry == true{
            txtPass.isSecureTextEntry = false
            showPasswordButton.setTitle("Hide", for: .normal)
            txtPass.rightView = showPasswordButton
            
        }else{
            txtPass.isSecureTextEntry = true
            showPasswordButton.setTitle("Show", for: .normal)
            txtPass.rightView = showPasswordButton
        }

}
}
