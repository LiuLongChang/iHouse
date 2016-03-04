//
//  PostRefreshTokenModel.swift
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit



let kPostRefreshTokenModelUN : String = "UN"
let kPostRefreshTokenModelRefreshToken : String = "RefreshToken"





class PostRefreshTokenModel: NSObject,NSCoding,NSCopying {
    
    
    var uN : NSString!
    var refreshToken : NSString!
    
    
    
    
    
    
    class func modelObjectWithDictionary(dict:NSDictionary)->PostRefreshTokenModel{
        return (PostRefreshTokenModel(coder: NSCoder())?.initWithDictionary(dict))!
    }
    
    
    
    
    func initWithDictionary(dict:NSDictionary)->PostRefreshTokenModel{
        
        if (dict.isKindOfClass(NSDictionary.classForCoder())){
        
            self.uN = self.objectOrNilForKey(kPostRefreshTokenModelRefreshToken, fromDictionary: dict) as! NSString
            self.refreshToken = self.objectOrNilForKey(kPostRefreshTokenModelRefreshToken, fromDictionary: dict) as! NSString
        
        }
        
        return self
    }
    
    
    
    
    func dictionaryRepresentation()->NSDictionary{
        
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.uN, forKey: kPostRefreshTokenModelUN);
        mutableDict.setValue(self.refreshToken, forKey: kPostRefreshTokenModelRefreshToken)
        return NSDictionary(dictionary: mutableDict);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func objectOrNilForKey(aKey:AnyObject, fromDictionary dict:NSDictionary)->AnyObject{
        
        let object = dict.objectForKey(aKey)
        return ((object?.isEqual(NSNull()) == true) ? nil : object)!

    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        self.uN = aDecoder.decodeObjectForKey(kPostRefreshTokenModelUN) as! NSString
        self.refreshToken = aDecoder.decodeObjectForKey(kPostRefreshTokenModelRefreshToken) as! NSString
        
    }
    
    
    
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(uN, forKey: kPostRefreshTokenModelUN)
        aCoder.encodeObject(refreshToken, forKey: kPostRefreshTokenModelRefreshToken)
    }
    
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let copy = PostRefreshTokenModel(coder: NSCoder())
        if((copy) != nil){
            copy!.uN = self.uN.copyWithZone(zone) as! NSString
            copy!.refreshToken = self.refreshToken.copyWithZone(zone) as! NSString
        }
        
        return copy!
    }
    
    
    
    
    
    
    
    
    

}
