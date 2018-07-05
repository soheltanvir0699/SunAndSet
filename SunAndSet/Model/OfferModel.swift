//
//  OfferModel.swift
//  SunAndSet
//
//  Created by User on 7/2/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit


    struct OfferModel: Decodable {
        var data: [Cate]
        
        
        struct Cate: Decodable {
            var id: Int
            var name: String
            var new: Int?
            var used: Int?
            var sale: Int?
            var rent: Int?
           
            
        
    }}

struct OffersModel: Decodable {
    var data: [Offers]
    
    var lastPage:Int?
    struct Offers: Decodable {
        var id: Int
        var created_at: String
        var updated_at: String
        var category_id: Int
        var  offer_image: String
    }}


