//
//  RequestComponent.swift
//  Spoon
//
//  Created by hesham ghalaab on 3/2/18.
//  Copyright © 2018 hesham ghalaab. All rights reserved.
//

import Foundation

class RequestComponent{
    
    enum Component {
        case content
        case authorization
        case platform
        case version
    }
    
    class func headerComponent(_ component: [Component]) -> [String: String]{
        var header = [String: String]()
        
        for singleComponent in component{
            switch singleComponent{
            case .authorization:
                header["Authorization"] = "Bearer " + UsersDefault.Token
                    //+ Defaults.token
                
            case .content:
                header["Content-Type"] = "application/json"
                
            case .platform:
                header["platform"] = "ios"
                
            case .version:
                header["version"] = "1"
            }
        }
        
        return header
    }
    
    
}
