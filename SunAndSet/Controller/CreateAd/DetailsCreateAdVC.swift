//
//  DetailsCreateAdVC.swift
//  SunAndSet
//
//  Created by User on 7/5/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import DLRadioButton
class DetailsCreateAdVC: UIViewController {

    @IBOutlet weak var BtnCheckNew: DLRadioButton!
    @IBOutlet weak var BtnCheckUsed: DLRadioButton!
    @IBOutlet weak var BtnPhoneCallNew: DLRadioButton!
    @IBOutlet weak var BtnEmailNew: DLRadioButton!
    @IBOutlet weak var txtDes: SkyFloatingLabelTextField!
    @IBOutlet weak var txtPrice: SkyFloatingLabelTextField!
    @IBOutlet weak var lblFirstValue: UILabel!
    @IBOutlet weak var lblSecandValue: UILabel!
    
    @IBOutlet weak var lblCatName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
         BtnCheckNew.isSelected=false
        MultiSelection()
        lblCatName.text=CategoryName + " > " + SupCategoryName
        if New==1{
          lblFirstValue.text="New"
        lblSecandValue.text="Used"
        }
        else{
            lblFirstValue.text="Sale"
            lblSecandValue.text="Rent"
        }
    }
    func MultiSelection(){
     // BtnCheckNew.isSelected = true
        BtnPhoneCallNew.isMultipleSelectionEnabled = true
        BtnEmailNew.isMultipleSelectionEnabled = true
        
        
    }
    @IBAction func BtnCheckNew(_ sender: UIButton) {
       print("omar")
        
    }
    @IBAction func BtnChooseLocation(_ sender: UIButton) {
        
    }
    @IBAction func BtnChooseCat(_ sender: UIButton) {
      
    }
    
   
    

}
