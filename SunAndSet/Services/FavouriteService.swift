//
//  FavouriteService.swift
//  SunAndSet
//
//  Created by User on 7/4/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class FavouriteService: NSObject {
    class func AddFavourite(ProductId:Int,completion: @escaping (_ error: String?,_ success: Bool)->Void)  {
       
        let url = Constants.Urls.Addfavourite+"\(ProductId)"+"/favorite"
        print(url)
        let headers = RequestComponent.headerComponent([.content, .authorization])
        print(url)
        Alamofire.request(url, method: .post, parameters:nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                print(url)
                print(headers)
                switch response.result
                {
                case .failure(let error):
                    completion("No Internet Connection",false)
                    print(error,"error")
                    
                    
                    
                case .success(let value):
                    let json = JSON(value)
                    print(json,"jSon")
                    let dataArr = json[]
                    ResultString = dataArr["message"].string ?? " "
                    
                    completion(nil, true)
                }
                
        }
    }
    class func getFavouriteByUserId( completion: @escaping (_ error: String?,_ success: Bool, _ CapPro: [advertiseModel.Cate]?)->Void)  {
        
        let url = Constants.Urls.getfavoriteByUserID
        //print(url)
       let headers = RequestComponent.headerComponent([.authorization])
        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers: headers)
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
                    do{
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
}
