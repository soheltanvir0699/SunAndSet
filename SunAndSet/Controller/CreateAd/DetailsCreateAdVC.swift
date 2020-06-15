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
        let newBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(self.back(_:)))
        newBackButton.image = UIImage(named: "back_nav")
        navigationItem.leftBarButtonItem = newBackButton
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
    @objc func back(_ sender: UIBarButtonItem?) {
        RootView.toChoosePhotoVC(withVC: self, title: "Create Ad")
    }
    func MultiSelection(){
     // BtnCheckNew.isSelected = true
        BtnPhoneCallNew.isMultipleSelectionEnabled = true
        BtnEmailNew.isMultipleSelectionEnabled = true
        
        
    }
    func base64(from image: [UIImage]) -> [String]? {
        for i in image{
        let imageData = UIImageJPEGRepresentation(i, 0.5)
        if let imageString = imageData?.base64EncodedString(options: .endLineWithLineFeed) {
            return [imageString]
            }}
        return nil
        }
    @IBAction func BtnCheckNew(_ sender: UIButton) {
       print("omar")
        
    }
    @IBAction func BtnChooseLocation(_ sender: UIButton) {
        
    }
    @IBAction func BtnChooseCat(_ sender: UIButton) {
      RootView.toCreateAdVC(withVC: self, title: "ChooseCategory")
    }
    @objc func ShowPopUp(){
        print("Hassan")
        let rootView = Bundle.main.loadNibNamed("PopUpStatus", owner: self, options: nil)?[0] as? PopUpStatus
        rootView?.BtnClose.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
        rootView?.BtnLogin.addTarget(self, action: #selector(ViewAdBtnAction), for: .touchUpInside)
        rootView?.LblSatuts.text = "Done!"
        rootView?.LblMessage.text = "Your ad has been placed succesfully"
        rootView?.BtnLogin.setTitle("View Ad", for: .normal)
        rootView?.ImageSatuts.image = UIImage(named: "success")
        if let aView = rootView {
            aView.tag = 100
            self.navigationController?.view.addSubview(aView)
            guard let navView = self.navigationController?.view else {return}
            navView.addSubview(aView)
            aView.translatesAutoresizingMaskIntoConstraints = false
            aView.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
            aView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
            aView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
            aView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
        }
    }
    @objc func ViewAdBtnAction(){
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
       RootView.toListOffAdsUsersVC(withVC: self, title: "uy", UserID: UsersDefault.userId)
    }
    @objc func dismissSupView() {
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
        
    }
    var Status=""
    @IBAction func BtnFinish(_ sender: UIButton) {
        guard   let Desciption = txtDes.text?.trimmed, !Desciption.isEmpty,  let Price = txtPrice.text, !Price.isEmpty
            else  {
                alertUser(title: "", message: "please fill all the fields")
                return
        }
        if BtnCheckNew.isSelected==false && BtnCheckUsed.isSelected==false{
             alertUser(title: "", message: "please check \(lblFirstValue.text!)OR \(lblSecandValue.text!)")
            return
        }
        
        showLoading()
       
        if BtnCheckNew.isSelected==true{
            Status=lblFirstValue.text!
        }
        else{
            Status=lblSecandValue.text!
        }
        let  imagesBase64 = base64(from: myImages)
        AdsService.CreateAds(name: NameOfAds, description: Desciption, price: Int(Price)!, category_id: CategoeryId, area_id: 1, Image: imagesBase64!, status: Status, address: "Alwasta") { (error: String?, success: Bool) in
            if success {
                self.hideLoading()
                print("omar555")
                self.ShowPopUp()
                // self.alertUser(title: "", message: "sucess" )
                // self.cleartext()
            }
            else  {self.hideLoading()
                print(Error.self)
                self.alertUser(title: "", message: error! )
            }
            
        }

    }

}
