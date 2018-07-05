//
//  Offers.swift
//  SunAndSet
//
//  Created by User on 7/2/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class OffersService: NSObject {
    class func getOffersByCatData(currentPage: Int ,limit:Int=15,CatId:Int, completion: @escaping (_ error: String?,_ success: Bool, _ Offer: [OffersModel.Offers]?, _ lastPage:OffersModel?)->Void)  {
        
        let url = Constants.Urls.AllOfferByCat+"\(CatId)"
        print(url)
        let parameters: [String: Any] = [
            
            "currentPage": currentPage,
            "limit":limit
            
        ]
        
        let headers: HTTPHeaders = [
            "lang": "1"
        ]
        Alamofire.request(url, method: .get, parameters:parameters, encoding: URLEncoding.default, headers: headers)
            //.validate(statusCode: 200..<300)
            
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    completion("No Internet",false, nil,nil)
                    print(error,"error")
                    
                case .success:
                    let jsonData = response.data
                    do{
                        let userData = try JSONDecoder().decode(OffersModel.self, from: jsonData!)
                        let OffersData = userData.data
                        if OffersData.count == 0{
                            completion("EmptyData",false, nil,nil)
                            return
                        }
                        print(OffersData,"SupCat")
                        
                        completion(nil,true, OffersData,userData)
                    }
                    catch{
                        print("************************")
                        print(error)
                        
                        completion(nil,false, nil,nil)
                    }
                }
        }}}
