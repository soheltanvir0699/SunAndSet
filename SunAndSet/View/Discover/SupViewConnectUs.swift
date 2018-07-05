//
//  SupViewConnectUs.swift
//  SunAndSet
//
//  Created by User on 6/21/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class SupViewConnectUs: UIView {

    @IBOutlet weak var ViewAlert: UIView!
    @IBOutlet weak var ViewTitle: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhomeNum: UILabel!
    @IBOutlet weak var ImageOwner: UIImageView!
    @IBOutlet weak var BtnMessage: UIButton!
    @IBOutlet weak var BtnCall: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.frame=self.bounds
        self.view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissSupView))
         view.addGestureRecognizer(tap)
     ViewTitle.layer.cornerRadius=4
        ViewAlert.layer.cornerRadius=10
    }
    @objc func dismissSupView() {
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismissSupView"), object: self)
    }
    
}
