//
//  AppDelegate.swift
//  SunAndSet
//
//  Created by User on 6/14/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        CustomeFont()
       initNavigationController()
        // Keyboard Custimize
        //IQKeyboardManager.shared.en
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField=50.0
        IQKeyboardManager.shared.shouldResignOnTouchOutside=true
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

// functions Help
    func CustomeFont(){
     //  UILabel.appearance().font = UIFont(name: "OpenSans-Regular", size: 4)
        
      // UILabel.appearance().substituteFontName = "OpenSans"
        UIButton.appearance().titleLabel?.font = UIFont.OpenSansSemiBold(size: 15)
    }
    func initNavigationController(){
       UINavigationBar.appearance().barTintColor = UIColor(red:255, green:255, blue:255, alpha:1.0)
        let attributes = [
                       NSAttributedStringKey.foregroundColor : UIColor.black,
                      NSAttributedStringKey.font : UIFont.OpenSansBold(size: 18)
                  ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        let barItemAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.darkGray,
            NSAttributedStringKey.font : UIFont.OpenSansBold(size: 16)
        ]
      
        UINavigationBar.appearance().backItem?.title = ""
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back_nav")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back_nav")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().shadowImage = UIImage()
        UIBarButtonItem.appearance().setTitleTextAttributes(barItemAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barItemAttributes, for: .highlighted)
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance().largeTitleTextAttributes =
                [NSAttributedStringKey.foregroundColor: UIColor.black,
                 NSAttributedStringKey.font: UIFont.OpenSansBold(size: 32)]
        } else {
            // Fallback on earlier versions
        }
    }
}

