//
//  Defualts.swift
//  SunAndSet
//
//  Created by User on 6/14/18.
//  Copyright © 2018 clueapps. All rights reserved.
//

import Foundation

class Defualts{
    static func getAllPro()->[userModel1]{
        if let all = UserDefaults.standard.array(forKey:"IDPro") as? [Dictionary<String,Any>]{
            return all.map{userModel1.init(dictionery:$0)}

        }
        return[]
        
    }
    static func clearUserDefault(){
        UserDefaults.standard.removeObject(forKey: "IDPro")
        
        UserDefaults.standard.synchronize()
    }
    static func insertPro(id:Int)->Bool{
        let newUserModel = userModel1.init(id:id)
        var all = getAllPro()
        let index = all.index{$0.id==id}
        if index == nil {
            
            
            all.append(newUserModel)
            print(all,"newUserModel")
            
            UserDefaults.standard.set(newUserModel, forKey: "IDPro")
            
        }
        else{return false}
            return UserDefaults.standard.synchronize()
    }
    static func deletePro(ID:Int){
        var all = getAllPro()
        let index = all.index{$0.id==ID}
        if index != nil {
            all.remove(at: index!)
            print("UserDelete")
            UserDefaults.standard.set(all.map{$0.dictionery}, forKey: "IDPro")
            
            UserDefaults.standard.synchronize()
        }
        else{ print("userNotDelete")}
        
    }
}



class userModel1:NSObject{
   
    var id :Int
    init(id :Int) {
        
        self.id=id
        super.init()
    }
    init(dictionery:[String:Any]){
      
        self.id = -1
        super.init()
        self.setValuesForKeys(dictionery)}
    var dictionery:[String:Any]{
        
        return self.dictionaryWithValues(forKeys: ["id"])
        
        
    }
}

