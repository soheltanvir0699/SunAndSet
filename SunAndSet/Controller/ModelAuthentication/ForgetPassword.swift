//
//  ForgetPassword.swift
//  SunAndSet
//
//  Created by User on 6/26/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class ForgetPassword: UIViewController {
 @IBOutlet weak var SendCode: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        SendCode.layer.cornerRadius=22
    }

    @IBAction func SendCode(_ sender: UIButton) {
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
