//
//  Utils_Info.swift
//  iHouse
//
//  Created by langyue on 16/3/8.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit


let userPath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("User.data")



class Utils_Info: NSObject {
    


    /*
    *   存储用户登录信息
    *
    */
    var hGUID : String!
    var token : String!
    var userName : String!
    
    
    class func setUserInfo(hGuid hGUID:String,token:Token,userName:String){
        
        
        let dict = token.dictionaryRepresentation()
        let model = PhoneLoginModel.modelObjectWithDictionary(dict)
        
        
//        model.hGUID = hGUID
//        token.dictionaryRepresentation()
//        
//        
//        //Token.dictionaryRepresentation(<#T##Token#>)
//    
//        
//        model.token = token
//        model.userName = userName
        
        
        NSKeyedArchiver.archiveRootObject(model, toFile: userPath)
    }
    
    
    class func getUserInfo()->PhoneLoginModel{
        let info = PhoneLoginModel()
        let model = NSKeyedUnarchiver.unarchiveObjectWithFile(userPath) as! PhoneLoginModel
        info.hGUID = model.hGUID
        info.token = model.token
        info.userName = model.userName
        return info
    }
    
    
    
    
    
    
    
    
    
    
    
    

}
