//
//  AdsService.swift
//  SunAndSet
//
//  Created by User on 7/9/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class AdsService: NSObject {
    class func CreateAds(name:String,description:String,price:Int,category_id:Int,area_id:Int,Image:[String],status:String,address:String,completion: @escaping (_ error: String?,_ success: Bool)->Void)  {
        
        let url = Constants.Urls.CreateAd
        let parameters: [String: Any] =  [
            
            "name"      : name,
            "description"            : description,
            "price"         : price,
            "category_id"        : category_id,
             "area_id"        : area_id,
            "image"    : Image,
            "status"            : status,
              
            
            ]
        let headers = RequestComponent.headerComponent([ .authorization])
        print(url)
        print(headers,"headers")
        print(parameters,"parameters")
        Alamofire.request(url, method: .post, parameters:parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
               
                switch response.result
                {
                case .failure(let error):
                    completion(error.localizedDescription,false)
                    print(error.localizedDescription,"error")
                case .success(let value):
                    let json = JSON(value)
                    print(json,"jSon")
                    let dataArr = json[]
                  guard let  Message = dataArr["success"].string
                    else{
                         completion("Error happen in format data",false)
                        return
                    }
                    print(Message,"Message")
                    completion(nil, true)
                }
                
        }
    }
    class func getProByCatID(Id:Int, completion: @escaping (_ error: String?,_ success: Bool, _ CapPro: [advertiseModel.Cate]?,_ Slider: [advertiseModel.slider]?)->Void)  {
        
        let url = Constants.Urls.CatPro
        //print(url)
        let parameters: [String: Any] = [
            
            "categoryId": "16",
            
            
            ]
        let headers: HTTPHeaders = [
            "lang": "1"
        ]
        print(parameters,"parameters")
        Alamofire.request(url, method: .get, parameters:parameters, encoding: URLEncoding.default, headers: headers)
            //.validate(statusCode: 200..<300)
            
            .responseJSON { response in
                print(url)
                switch response.result
                {
                case .failure(let error):
                    completion(error.localizedDescription,false, nil,nil)
                    print(error,"error")
                    
                case .success:
                    let jsonData = response.data
                    do{
                        let userData = try JSONDecoder().decode(advertiseModel.self, from: jsonData!)
                        let CatPro = userData.data
                        let SliderImage = userData.slider
                        // let CatPro = userData.
                        if CatPro.count == 0{
                            completion("NoProductsFound",false, nil,nil)
                            return
                        }
                        print(CatPro,"CatPro")
                        
                        completion(nil,true, CatPro,SliderImage)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil,nil)
                    }
                }
        }}
    class func getProByUserId(Id:Int, completion: @escaping (_ error: String?,_ success: Bool, _ CapPro: [advertiseModel.Cate]?)->Void)  {
        
        let url = Constants.Urls.CatPro
        print(Id)
        let parameters: [String: Any] = [
            
            "userId": Id,
            
            
            ]
        let headers: HTTPHeaders = [
            "lang": "1"
        ]
        print(parameters,"parameters")
        Alamofire.request(url, method: .get, parameters:parameters, encoding: URLEncoding.default, headers: headers)
            //.validate(statusCode: 200..<300)
            
            .responseJSON { response in
                print(url)
                switch response.result
                {
                case .failure(let error):
                    completion(error.localizedDescription,false, nil)
                    print(error,"error")
                    
                case .success:
                    let jsonData = response.data
                    do{print(response.data!,"response")
                        let userData = try JSONDecoder().decode(advertiseModel.self, from: jsonData!)
                        let CatPro = userData.data
                        
                        // let CatPro = userData.
                        if CatPro.count == 0{
                            completion("NoProductsFound",false, nil)
                            return
                        }
                        print(CatPro,"CatPro")
                        
                        completion(nil,true, CatPro)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil)
                    }
                }
        }}
    class func getCitiesData( completion: @escaping (_ error: String?,_ success: Bool, _ Cities: [CitiesModel.City]?)->Void)  {
        
        let url = Constants.Urls.Cities
        print(url)
        let headers: HTTPHeaders = [
            "lang": "1"
        ]
        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers: headers)
            //.validate(statusCode: 200..<300)
            
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    completion(error.localizedDescription,false, nil)
                    print(error,"error")
                    
                case .success:
                    let jsonData = response.data
                    do{
                        let userData = try JSONDecoder().decode(CitiesModel.self, from: jsonData!)
                        let CitiyData = userData.data
                       
                        print(CitiyData,"CitiyData")
                        
                        completion(nil,true, CitiyData)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil)
                    }
                }
        }}
    
}
