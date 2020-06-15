//
//  ChoosePhotoVC.swift
//  SunAndSet
//
//  Created by User on 7/5/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
 var myImages = [UIImage]()
var NameOfAds = ""
class ChoosePhotoVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
var imagePicker=UIImagePickerController()
    @IBOutlet weak var CollectionVewPhoto: UICollectionView!
    @IBOutlet weak var BtnNext: UIButton!
    @IBOutlet weak var txtTitle: SkyFloatingLabelTextField!
    
    @IBOutlet weak var ImageToselected: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        SetBackBarButton()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(ShowPopUp))
BtnNext.layer.cornerRadius = 4
        ImageToselected.isUserInteractionEnabled=true
       
    }
    func SetBackBarButton()
    {
        //Back buttion
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: "back_nav"), for: UIControlState())
        btnLeftMenu.addTarget(self, action: #selector(ShowPopUp) , for: UIControlEvents.touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }
    @objc func ShowPopUp(){
        print("Hassan")
        let rootView = Bundle.main.loadNibNamed("PopUpStatus", owner: self, options: nil)?[0] as? PopUpStatus
        rootView?.BtnClose.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
         rootView?.BtnLogin.addTarget(self, action: #selector(DiscrdBtnAction), for: .touchUpInside)
        rootView?.LblSatuts.text = "Are you sure?"
        rootView?.LblMessage.text = "Your entered data will be discarded"
         rootView?.LblMessage.text = "Your entered data will be discarded"
        rootView?.BtnLogin.setTitle("Discard", for: .normal)
        rootView?.ImageSatuts.image = UIImage(named: "trash")
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
    @objc func DiscrdBtnAction(){
    myImages = [UIImage]()
        NameOfAds = ""
        
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
         _ = navigationController?.popViewController(animated: true)
    }
    @objc func dismissSupView() {
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
      
    }
    @IBAction func BtnNext(_ sender: UIButton) {
        guard   let Title = txtTitle.text?.trimmed, !Title.isEmpty
            else  {
                alertUser(title: "", message: "please fill Title field")
                return
        }
        if myImages.count==0{
            self.alertUser(title: "", message: " Upload at last 1 Image " )
            
        }
        else{
            NameOfAds=Title
            RootView.toDetailsCreateAdVC(withVC: self, title: "Create Ad")}
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myImages.count
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            myImages.append(image)
            CollectionVewPhoto.reloadData()
            print(image,"image")
            dismiss(animated: true, completion: nil)
            
        
    }
    @IBAction func ActionSelect(_ sender: UITapGestureRecognizer) {
        if myImages.count==7{
            self.alertUser(title: "", message: " Upload at most 7 Images " )
            
        }
        else{
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate=self
            present(imagePicker, animated: true, completion: nil)}
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:PhotoCell=collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
       cell.Image.image = myImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {let  ScreanWidth = UIScreen.main.bounds.size.width
        let width = (ScreanWidth-40)/2
        // width = width > 200 ? 200: width
        return CGSize.init(width: 48 , height:48)
        
        
    }
}
