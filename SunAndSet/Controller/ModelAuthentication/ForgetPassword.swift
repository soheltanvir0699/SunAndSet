//
//  ForgetPassword.swift
//  SunAndSet
//
//  Created by User on 6/26/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class ForgetPassword: UIViewController {
    @IBOutlet weak var ViewErrorPhone: UIView!
    @IBOutlet weak var SendCode: UIButton!
    @IBOutlet weak var txtPhone: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        SendCode.layer.cornerRadius=22
        ViewErrorPhone.isHidden=true
    }

    @IBAction func SendCode(_ sender: UIButton) {
        showLoading()
        guard   let mobile = txtPhone.text?.trimmed, !mobile.isEmpty
            else  {
                alertUser(title: "", message: "please fill PhoneNumbet field")
                return
        }

         AuthenticationService.ForgetPassword(country_code: "+20", mobile: mobile, password: "444") { (error: String?, success: Bool) in
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
        
        _ = UINib.init(nibName: "PopUpStatus", bundle: nil)
        //self.view.register(nib, forCellReuseIdentifier: "SupViewConnectUs")
        let rootView = Bundle.main.loadNibNamed("PopUpStatus", owner: self, options: nil)?[0] as? PopUpStatus
        rootView?.BtnClose.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
        if let aView = rootView {
            aView.tag = 100
            self.navigationController?.view.addSubview(aView)
            self.tabBarController?.tabBar.isHidden=true
        
        
        }}
        @objc func dismissSupView() {
            for subview in (self.navigationController?.view.subviews)! {
                if (subview.tag == 100) {
                    subview.removeFromSuperview()
                }
            }
            self.tabBarController?.tabBar.isHidden=false
        }

}
