//
//  Cat22.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CategoeryService: NSObject {
    class func getHomeData( completion: @escaping (_ error: String?,_ success: Bool, _ categories: [HomeModel.Cate]?,_ ImageSlider: [HomeModel.image]?)->Void)  {
        
        let url = Constants.Urls.categories
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
                    completion("error",false, nil,nil)
                    print(error,"error")
                    
                case .success:
                     let jsonData = response.data
                     do{
                      let userData = try JSONDecoder().decode(HomeModel.self, from: jsonData!)
                     let SliderData = userData.image
                     let categoriesData = userData.data
                    print(SliderData,"SliderData")
                         print(categoriesData,"categoriesData")
                    
                    completion(nil,true, categoriesData,SliderData)
                }
                     catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil,nil)
                    }
        }
        }}
    class func getSupCatData(CatId:Int, completion: @escaping (_ error: String?,_ success: Bool, _ SupCat: [SupCatModel.Cate]?)->Void)  {
        
        let url = Constants.Urls.SupCat+"\(CatId)"
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
                    completion("error",false, nil)
                    print(error,"error")
                    
                case .success:
                      let jsonData = response.data
                    do{
                         let userData = try JSONDecoder().decode(SupCatModel.self, from: jsonData!)
                       let SupCat = userData.data
                        if SupCat.count == 0{
                             completion("NoProductsFound",false, nil)
                            return
                        }
                        print(SupCat,"SupCat")
                        
                        completion(nil,true, SupCat)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil)
                    }
                }
        }}
    class func getProById(parameterKey:String,Id:Int, completion: @escaping (_ error: String?,_ success: Bool, _ CapPro: [advertiseModel.Cate]?,_ Slider: [advertiseModel.slider]?)->Void)  {

        let url = Constants.Urls.CatPro
        //print(url)
        let parameters: [String: Any] = [

            parameterKey: Id,
            

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
                    completion("error",false, nil,nil)
                    print(error,"error")

                case .success:
                    let jsonData = response.data
                    do{print(response.data!)
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
    
    class func getAllCatData( completion: @escaping (_ error: String?,_ success: Bool, _ categories: [OfferModel.Cate]?)->Void)  {
        
        let url = Constants.Urls.AllCat
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
                    completion("error",false, nil)
                    print(error,"error")
                    
                case .success:
                    let jsonData = response.data
                    do{
                        let AllCutData = try JSONDecoder().decode(OfferModel.self, from: jsonData!)
                      
                        let AllCategoriesData = AllCutData.data
                        if AllCategoriesData.count == 0{
                            completion("NoProductsFound",false, nil)
                            return
                        }
                        print(AllCategoriesData,"categoriesData")
                        
                        completion(nil,true, AllCategoriesData)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil)
                    }
                }
        }}
   
}
