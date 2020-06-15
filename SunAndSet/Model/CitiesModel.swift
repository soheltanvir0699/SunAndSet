//
//  CitiesModel.swift
//  SunAndSet
//
//  Created by User on 7/16/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

struct CitiesModel: Decodable {
    var data: [City]
    struct City: Decodable {
        var id: Int
        var name: String
        var language_id: Int
        var created_at: String?
        var updated_at: String?
       
    }
}


