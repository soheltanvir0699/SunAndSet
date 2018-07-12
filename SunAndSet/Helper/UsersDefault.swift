//
//  UsersDefault.swift
//  SunAndSet
//
//  Created by User on 7/2/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

class UsersDefault: NSObject {
    static var userName: String {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userName)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.Key.userName) ?? ""
        }
    }
    
    static var userMobile: Int {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userMobile)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.integer(forKey: Constants.Key.userMobile) 
        }
    }
    
    static var userCountryCode: Int {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userCountryCode)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.integer(forKey: Constants.Key.userCountryCode)
        }
    }
    
    static var userPassword: String {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userPassword)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.Key.userPassword) ?? ""
        }
    }
    
    static var userId: Int {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userId)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.integer(forKey: Constants.Key.userId)
        }
    }
    static var userEmail: String {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userEmail)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.Key.userEmail) ?? ""
        }
    }
    static var userIsLogged: Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.userIsLogged)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: Constants.Key.userIsLogged)
        }
    }
    static var Token: String {
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.Key.token)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey: Constants.Key.token) ?? ""
        }
    }
    class func printUserData(){
        print("\n////******************////")
      
        print("userPassword: ", UsersDefault.userPassword)
        print("userName: ", UsersDefault.userName)
        print("userMobile: ", UsersDefault.userMobile)
       
      
        print("userId: ", UsersDefault.userId)
        print("userEmail: ", UsersDefault.userEmail)
        print("userCountryCode: ", UsersDefault.userCountryCode)
        print("token: ", UsersDefault.Token)
        print("////******************////\n")
    }
   class  func deleteUserDataFromUSerDefaults(){
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: Constants.Key.userIsLogged)
        
        defaults.removeObject(forKey: Constants.Key.userId)
        defaults.removeObject(forKey: Constants.Key.userName)
        defaults.removeObject(forKey: Constants.Key.userEmail)
        defaults.removeObject(forKey: Constants.Key.userMobile)
        defaults.removeObject(forKey: Constants.Key.token)
        defaults.removeObject(forKey: Constants.Key.userCountryCode)
        defaults.synchronize()
    }
    
}

