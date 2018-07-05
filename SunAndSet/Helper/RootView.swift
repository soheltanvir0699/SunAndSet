//
//  RootView.swift
//  SunAndSet
//
//  Created by User on 6/21/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class RootView: NSObject {
    class func toMainViewVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.MainViewVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryBoardID)
        vc.present(controller, animated: true, completion: nil)
       
    }
   
    class func toChoosePhotoVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ChoosePhotoVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ChoosePhotoVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toProductVC(withVC vc: UIViewController,title:String,SupCat:Int){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ProductVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ProductVC
        destination.title =  title
        destination.SupCatId = SupCat
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toProductVC(withVC vc: UIViewController,title:String,UserId:Int){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ProductVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ProductVC
        destination.title =  title
        destination.UserId = UserId
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toDescripProVC(withVC vc: UIViewController,title:String){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.DescripProVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! DescripProVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toListOffAdsUsersVC(withVC vc: UIViewController,title:String){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ListOffAdsUsersVC
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ListOffAdsUsersVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toSubcategoryVC(withVC vc: UIViewController,title:String,CatId:Int) {
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.SubcategoryVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! SubcategoryVC
        destination.title =  title
        destination.CatId=CatId
        vc.navigationController?.pushViewController(destination, animated: true)
       
    }
    class func toNotLoginVC(withVC vc: UIViewController){
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        vc.navigationController!.view.layer.add(transition, forKey: kCATransition)
        //self.navigationController?.pushViewController(dstVC, animated: false)
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.NotLoginVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! NotLoginVC
         //vc.tabBarController?.tabBar.isHidden=true
         destination.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(destination, animated: false)
        
    }
    class func toLoginVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.login
        let storyboard = UIStoryboard(name: "AuthenticationStoryboard", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! LoginVC
        destination.title =  title
        destination.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toRegisterVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.RegisterVC
        let storyboard = UIStoryboard(name: "AuthenticationStoryboard", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! RegisterVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toChangePasswordVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ChangePasswordVC
        let storyboard = UIStoryboard(name: "AuthenticationStoryboard", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ChangePasswordVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toEditProfileVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.EditProfileVC
        let storyboard = UIStoryboard(name: "AuthenticationStoryboard", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! EditProfileVC
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
    class func toForgetPasswordVC(withVC vc: UIViewController,title:String){
        let StoryBoardID = Constants.StoryBoardViewControllersIDs.ForgetPassword
        let storyboard = UIStoryboard(name: "AuthenticationStoryboard", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ForgetPassword
        destination.title =  title
        vc.navigationController?.pushViewController(destination, animated: true)
    }
}
