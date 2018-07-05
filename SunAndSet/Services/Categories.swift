//
//  Categories.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class Categories1: NSObject {
//    class func getNews(page: Int = 1,per_page:Int=25, completion: @escaping (_ error: Error?,_ success: Bool, _ categories: [Cat]?,_ ImageSlider: [Image]?)->Void)  {
//
//        let url = Constants.Urls.categories
//        print(url)
//        Alamofire.request(url, method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil)
//            //.validate(statusCode: 200..<300)
//            .responseJSON { response in
//
//                switch response.result
//                {
//                case .failure(let error):
//                    completion(error,false, nil,nil)
//                    print(error,"error")
//
//                case .success(let value):
//                    let json = JSON(value)
//                    guard let dataArr = json["slider"].array
//                        else {
//                            completion(nil,false, nil,nil)
//                            return
//                    }
//
//print(dataArr)
//                    var news = [Image]()
//                    for data in dataArr {
//                        guard let data = data.dictionary else{return}
//                        let new = Image()
//
//                        new.id=data["id"]?.int ?? -1
//                        new.advertising_id=data["advertising_id"]?.string ?? "غيرموجود"
//                        // cat.Price=data["price"]?.string ?? ""
//
//                        new.image = data["image"]?.string?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! ?? ""
//
//                        news.append(new)
//                    }
//
//                    completion(nil,true, nil,news)
//                }
//        }
//    }
}
