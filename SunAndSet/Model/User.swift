//
//  User.swift
//  SunAndSet
//
//  Created by User on 7/2/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import UIKit


    struct User: Decodable {
        
        var user: userData
        var token: String
        
        struct userData: Decodable{
            let id: Int
            let name: String
             let email: String
            let mobile: Int
             let block: Int?
             let country_code: Int
            let created_at: String
             let updated_at: String
           // let mobile_signup: Bool
        }
       
}

//"user": {
//    "name": "oma",
//    "country_code": 20,
//    "mobile": 11457788,
//    "email": "om1e@test.com",
//    "updated_at": "2018-07-04 14:26:06",
//    "created_at": "2018-07-04 14:26:06",
//    "id": 9
//},
//"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9zdW5hbmRzYXQubXRlY2gtaW5zLmNvbVwvYXBpXC92MVwvc2lnbnVwIiwiaWF0IjoxNTMwNzE0MzY3LCJleHAiOjE1MzA3MTc5NjcsIm5iZiI6MTUzMDcxNDM2NywianRpIjoiV1UzdlpHdjd3YkwyQnNPdSIsInN1YiI6OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.DUYzvN1CVD6QXleCXnz1fWWMCKH5MV6PclhU9jl6MMA"
//}
