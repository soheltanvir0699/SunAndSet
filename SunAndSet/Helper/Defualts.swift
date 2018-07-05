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
        if let all = UserDefaults.standard.array(forKey:"userskey4") as? [Dictionary<String,Any>]{
            return all.map{userModel1.init(dictionery:$0)}
            
        }
        return[]
        
    }
    static func clearUserDefault(){
        UserDefaults.standard.removeObject(forKey: "userskey4")
        
        UserDefaults.standard.synchronize()
    }
    static func insertPro(name:String,price:Float,Qte:Int,image:String,id:Int)->Bool{
        let newUserModel = userModel1.init(name:name,price:price,Qte:Qte,image:image,id:id)
        var all = getAllPro()
        let index = all.index{$0.name==name}
        if index == nil {
            
            
            all.append(newUserModel)
            UserDefaults.standard.set(all.map{$0.dictionery}, forKey: "userskey4")}
        else{return false}
        return UserDefaults.standard.synchronize()
    }
    static func deletePro(ID:Int){
        var all = getAllPro()
        let index = all.index{$0.id==ID}
        if index != nil {
            all.remove(at: index!)
            print("UserDelete")
            UserDefaults.standard.set(all.map{$0.dictionery}, forKey: "userskey4")
            
            UserDefaults.standard.synchronize()
        }
        else{ print("userNotDelete")}
        
    }
    static func updateQte(name:String,price:Float,Qte:Int){
        var all = getAllPro()
        let index = all.index{$0.name==name}
        
        if index != nil {
            // change quantity for this user
            all[index!].Qte = Qte
            
            // also if you want to change price
            // all[index!].preice = price
            
            UserDefaults.standard.set(all.map{$0.dictionery}, forKey: "userskey4")
            
            UserDefaults.standard.synchronize()
        }
        else{ print("userNotUpdate")}
        
    }
}



class userModel1:NSObject{
    var name :String
    var price :Float
    var Qte :Int
    var image:String
    var id :Int
    init(name:String,price:Float,Qte:Int,image:String,id :Int) {
        self.name=name
        self.price=price
        self.Qte=Qte
        self.image=image
        self.id=id
        super.init()
    }
    init(dictionery:[String:Any]){
        self.name=""
        
        self.price=0.0
        self.Qte=0
        self.image=""
        self.id=0
        super.init()
        self.setValuesForKeys(dictionery)}
    var dictionery:[String:Any]{
        
        return self.dictionaryWithValues(forKeys: ["name","price","Qte","image","id"])
        
        
    }
}

