//
//  LogOut.swift
//  SunAndSet
//
//  Created by User on 7/10/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class LogOut: UIView {

    @IBOutlet weak var ViewPopup: UIView!
    @IBOutlet weak var BtnClose: UIButton!
    @IBOutlet weak var BtnLogin: UIButton!
     @IBOutlet weak var BtnCancel: UIButton!
    @IBOutlet weak var LblSatuts: UILabel!
    @IBOutlet weak var LblMessage: UILabel!
    @IBOutlet weak var ImageSatuts: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewPopup.layer.cornerRadius=10
        BtnLogin.layer.cornerRadius=4
        BtnCancel.layer.cornerRadius=4
    }
   
}
