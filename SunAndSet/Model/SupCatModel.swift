//
//  SupCatModel.swift
//  SunAndSet
//
//  Created by User on 6/26/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit

struct SupCatModel: Decodable {
    var data: [Cate]
    struct Cate: Decodable {
        var id: Int
        var name: String
        var new: Int
        var used: Int
        var sale: Int
        var rent: Int
    }
}
