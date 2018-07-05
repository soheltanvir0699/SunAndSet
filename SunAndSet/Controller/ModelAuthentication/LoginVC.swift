//
//  LoginVC.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class LoginVC: UIViewController {
    var showPasswordButton = UIButton(type: .custom)
    @IBOutlet weak var txtPhone: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPass: SkyFloatingLabelTextField!
    @IBOutlet weak var ViewPhoneError: UIView!
    @IBOutlet weak var ViewPassError: UIView!
    @IBOutlet weak var lblErrorPhone: UILabel!
    @IBOutlet weak var lblErrorPass: UILabel!
    @IBOutlet weak var BtnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         ViewErrorStatus(IsHidden:true)
        BtnLogin.layer.cornerRadius=22
        CustomizeShowPassword(txtPass)
        // Do any additional setup after loading the view.
        
       
    }
    func ViewErrorStatus(IsHidden:Bool){
        ViewPassError.isHidden=IsHidden
        ViewPhoneError.isHidden=IsHidden
    }
    func CustomizeShowPassword( _ textfiled:UITextField){
        
        showPasswordButton.setTitle("SHOW", for: .normal)
        showPasswordButton.setTitleColor(UIColor(red:0.78, green:0.78, blue:0.78, alpha:1.0) , for: .normal)
        showPasswordButton.titleLabel?.font =   UIFont.OpenSansRegular(size: 14)
        
        showPasswordButton.frame = CGRect(x: CGFloat(textfiled.frame.size.width - 60), y: CGFloat(5), width: CGFloat(60), height: CGFloat(25))
        showPasswordButton.addTarget(self, action: #selector(self.ShowPassword(_:)), for: .touchUpInside)
        textfiled.rightView = showPasswordButton
        textfiled.rightViewMode = .always
        //  txtPass.rightViewMode = .unlessEditing
        
        
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
    @IBAction func BtnForgotpass(_ sender: UIButton) {
        RootView.toForgetPasswordVC(withVC: self, title:"Forget Password")
    }
    @IBAction func Login(_ sender: UIButton) {
       self.ViewErrorStatus(IsHidden: true)
        guard   let mobile = txtPhone.text?.trimmed, !mobile.isEmpty,  let password = txtPass.text, !password.isEmpty
            else  {
                alertUser(title: "", message: "please fill all the fields")
                return
        }
         showLoading()
        AuthenticationService.Login( country_code: "+20", mobile: mobile, password:password) { (error: String?, success: Bool) in
            if success {
                self.hideLoading()
                print("omar555")
                RootView.toMainViewVC(withVC: self)
               // self.alertUser(title: "", message: "sucess" )
                // self.cleartext()
            }
            else  {self.hideLoading()
                print(Error.self)
                self.alertUser(title: "", message: error! )
            }
            
        }
        
    }
    @IBAction func SignUp(_ sender: UIButton) {
        RootView.toRegisterVC(withVC: self, title: "SignUP")
    }
}
