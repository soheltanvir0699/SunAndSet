//
//  advertiseModel.swift
//  SunAndSet
//
//  Created by User on 6/27/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

struct advertiseModel: Decodable {
    var data: [Cate]
     var slider: [slider]?
    struct slider: Decodable {
        var image: String
         var advertising_id: Int
     
    }
    struct Cate: Decodable {
        var id: Int
        var name: String
        var description: String
         var price: Int
        var status: String
        var view_count: Int
        var category_id: Int
        var area_id: Int
        var user_id: Int
        var created_at: String? = ""
        var updated_at: String?
        var city:City
        var isFave: Bool
         var cat_parent_name: String
        
         var user:User
        var category:HomeModel.Cate
         var images:[HomeModel.image]
          var area:area
    }
    struct City: Decodable{
         var name: String
        
    }
    struct User: Decodable{
        var id: Int
        var name: String
        var email: String
        var mobile: Int
        var country_code: Int
        
    }
    struct area: Decodable{
        var name: String
        
    }
}

//    "data": [
//    {
//    "id": 1,
//    "name": "موبايل ايفون 18 جيجا",
//    "description": "موبايل ايفون 18 جيجا بايت بيرن ومعاه سماعات اصليه وشاحن اصلى وليله كبيره ساعتدتك",
//    "price": 9000,
//    "status": "new",
//    "view_count": 16,
//    "category_id": 10,
//    "area_id": 1,
//    "user_id": 2,
//    "created_at": null,
//    "updated_at": "2018-06-27 14:01:11",
//    "City": {
//    "name": "القاهره"
//    },
//    "user": {
//    "id": 2,
//    "name": "Amr Bandora",
//    "email": "amr@gmail.com",
//    "mobile": 1148511669,
//    "country_code": 20
//    },
//    "category": {
//    "id": 10,
//    "name": "سكني",
//    "parent_id": 1,
//    "image": "http://sunandsat.mtech-ins.com/uploads/Categoriesimages",
//    "new": 0,
//    "used": 0,
//    "sale": 1,
//    "rent": 1,
//    "language_id": 1
//    },
//    "images": [
//    {
//    "id": 1,
//    "image": "15289006835b212c4b4988c.jpg",
//    "advertising_id": 1,
//    "created_at": null,
//    "updated_at": null
//    }
//    ],
//    "area": {
//    "name": "مصر"
//    }
//    }
//    ],
//    "currentPage": 1,
//    "lastPage": 1,
//    "limit": 10,
//    "count": 1
//}
