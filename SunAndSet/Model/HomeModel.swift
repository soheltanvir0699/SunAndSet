//
//  Categoreis.swift
//  SunAndSet
//
//  Created by User on 6/25/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

struct HomeModel: Decodable {
    var data: [Cate]
    var image: [image]
    struct image: Decodable {
        var id: Int
        var image: String?
        var advertising_id: Int?
    }
        
        struct Cate: Decodable {
            var id: Int
            var name: String
            var image: String?
            var parent_id: Int?
            var new: Int?
            var used: Int?
            var sale: Int?
            var rent: Int?
            var language_id: Int?
        
    }
}

