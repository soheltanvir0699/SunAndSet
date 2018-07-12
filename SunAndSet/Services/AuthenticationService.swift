//
//  AuthenticationService.swift
//  SunAndSet
//
//  Created by User on 6/28/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AuthenticationService: NSObject {
    class func Register(name: String, country_code: String,mobile:String, email: String,password: String,completion: @escaping (_ error: String?,_ success: Bool)->Void)  {
        let  device_id = UIDevice.current.identifierForVendor!.uuidString
        let url = Constants.Urls.signUpUrl
        //print(url)
        
        let parameters: [String: Any] =  [
            "name"                : name,
            "country_code"      : country_code,
            "mobile"            : mobile,
            "device_id"         : device_id,
            "device_model"        :  UIDevice.modelName,
            "firebase_token"    : "22",
            "password"            : password,
            "email"                : email
        ]
       
      let headers = RequestComponent.headerComponent([.version, .platform, .content])
        print(url)
        Alamofire.request(url, method: .post, parameters:parameters, encoding: JSONEncoding.default, headers: headers)
           .responseJSON { response in
                print(url)
            print(headers)
                print(parameters)
                switch response.result
                {
                case .failure(let error):
                    completion("No Internet Connection",false)
                    print(error,"error")
                case .success:
                    let data = response.data
                    if let data = data{
                        do{
                            
                            let userData = try JSONDecoder().decode(User.self, from: data)
                            print(userData.user.id,"userData.user.id")
                            UsersDefault.userId = userData.user.id
                            UsersDefault.Token = userData.token
                            UsersDefault.userName = userData.user.name
                            UsersDefault.userCountryCode = userData.user.country_code
                            UsersDefault.userMobile = userData.user.mobile
                            UsersDefault.userEmail = userData.user.email 
                            UsersDefault.userIsLogged = true
                            UsersDefault.printUserData()
                            print("OmarHasan")
                            completion("",true)
                        }catch{
                            print(error)
                            completion("The mobile or Email has already been taken",false)
                        }
                    }
                }

              }
        }
    class func Login( country_code: String,mobile:String,password: String,completion: @escaping (_ error: String?,_ success: Bool)->Void)  {
        let  device_id = UIDevice.current.identifierForVendor!.uuidString
        let url = Constants.Urls.loginUrl
        //print(url)
        
        let parameters: [String: Any] =  [
           
            "country_code"      : country_code,
            "mobile"            : mobile,
            "device_id"         : device_id,
            "device_model"        : UIDevice.modelName,
            "firebase_token"    : "22",
            "password"            : password,
        
        ]
        
     let headers = RequestComponent.headerComponent([.content, .version, .platform])
         print(url)
        Alamofire.request(url, method: .post, parameters:parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(url)
             // response.response?.statusCode=
                switch response.result
                {
                    
                case .failure(let error):
                    completion(error.localizedDescription,false)
                    print(error,"error")
                   case .success:
                    let data = response.data
                   
                    if let data = data {
                    let json = JSON(data)
                        print(json,"json")
                    let _ = json.dictionaryValue
                    
                    do{
                        let userData = try JSONDecoder().decode(User.self, from: data)
                      print(userData.user.id,"userData.user.id")
                        UsersDefault.userId = userData.user.id
                        UsersDefault.Token = userData.token
                        UsersDefault.userName = userData.user.name
                        UsersDefault.userCountryCode = userData.user.country_code
                        UsersDefault.userMobile = userData.user.mobile
                        UsersDefault.userEmail = userData.user.email
                        UsersDefault.userIsLogged = true
                        UsersDefault.printUserData()
                        
                         completion("",true)
                    }catch{
                        completion("The mobile or Email Not valid",false)
                    }
                }else{
                    completion("error occurred please try again later",false)
                }
        }
//                    let json = JSON(value)
//                    let dataArr = json[]
//                    let   message = dataArr["message"].string ?? " "
//                    print(message)
//                    print(dataArr)
//                  
//                    completion(nil, true)
                }
                
        }
    class func ForgetPassword( country_code: String,mobile:String,password: String,completion: @escaping (_ error: String?,_ success: Bool)->Void)  {
        let  device_id = UIDevice.current.identifierForVendor!.uuidString
        let url = Constants.Urls.ForgetPassUrl
        //print(url)
        
        let parameters: [String: Any] =  [
            
            "country_code"      : country_code,
            "mobile"            : mobile,
            "device_id"         : device_id,
            "device_model"        : UIDevice.modelName,
            "firebase_token"    : "22",
           "password"            : password,
            
            ]
        
        let headers = RequestComponent.headerComponent([.version, .platform])
        print(url)
        Alamofire.request(url, method: .post, parameters:parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(url)
                switch response.result
                {
                case .failure(let error):
                    completion(error.localizedDescription,false)
                    print(error,"error")
                case .success:
                    let data = response.data
                    
                    if let data = data {
                        let json = JSON(data)
                        print(json,"json")
                        let _ = json.dictionaryValue
                        
                        do{
                            let userData = try JSONDecoder().decode(User.self, from: data)
                            print(userData.user.id,"userData.user.id")
                            UsersDefault.userId = userData.user.id
                            UsersDefault.Token = userData.token
                            UsersDefault.userName = userData.user.name
                            UsersDefault.userCountryCode = userData.user.country_code
                            UsersDefault.userMobile = userData.user.mobile
                            UsersDefault.userEmail = userData.user.email
                            UsersDefault.userIsLogged = true
                            UsersDefault.printUserData()
                            
                            completion("",true)
                        }catch{
                            completion("The mobile or Email Not valid",false)
                        }
                    }else{
                        completion("error occurred please try again later",false)
                    }
                }
                //                    let json = JSON(value)
                //                    let dataArr = json[]
                //                    let   message = dataArr["message"].string ?? " "
                //                    print(message)
                //                    print(dataArr)
                //
                //                    completion(nil, true)
        }
        
    }
    }

