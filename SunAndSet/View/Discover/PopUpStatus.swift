//
//  PopUpStatus.swift
//  SunAndSet
//
//  Created by User on 6/24/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class PopUpStatus: UIView {

    @IBOutlet weak var ViewPopup: UIView!
    @IBOutlet weak var BtnClose: UIButton!
    @IBOutlet weak var BtnLogin: UIButton!
    
    @IBOutlet weak var LblSatuts: UILabel!
    @IBOutlet weak var LblMessage: UILabel!
    @IBOutlet weak var ImageSatuts: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewPopup.layer.cornerRadius=10
        BtnLogin.layer.cornerRadius=4
    }
    @IBAction func BtnClose(_ sender: Any) {
        
    }
}
