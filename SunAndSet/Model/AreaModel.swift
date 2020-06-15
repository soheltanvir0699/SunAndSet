//
//  AreaModel.swift
//  SunAndSet
//
//  Created by User on 7/16/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

struct AreaModel: Decodable {
    var data: [Data]
    var city: [Area]
    struct Area: Decodable {
        var id: Int
        var name: String
        var language_id: Int
        var created_at: String?
        var updated_at: String?
    }
    struct Data: Decodable {
        var id: Int
        var name: String
        
    }
        
}


