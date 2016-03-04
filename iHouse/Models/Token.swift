//
//  Token.swift
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit

let kTokenAccessExpire = "AccessExpire";
let kTokenRefreshToken = "RefreshToken";
let kTokenAccessToken = "AccessToken";



class Token: NSObject,NSCoding,NSCopying {
    
    
    var accessExpire : NSNumber!
    var refreshToken : NSString!
    var accessToken : NSString!
    
    
    
    override var description: String {
        return NSString(format: "%@", self.dictionaryRepresentation()) as String
    }
    
    
    class func modelObjectWithDictionary(dict:NSDictionary)->Token{
        return (Token(coder: NSCoder())?.initWithDictionary(dict))!
    }
    
    
    
    func initWithDictionary(dict:NSDictionary)->Token{
        if(dict.isKindOfClass(NSDictionary.classForCoder())){
            self.accessExpire = self.objectOrNilForKey(kTokenAccessToken, fromDictionary: dict) as! NSNumber
            self.refreshToken = self.objectOrNilForKey(kTokenRefreshToken, fromDictionary: dict) as! String
            self.accessToken = self.objectOrNilForKey(kTokenAccessToken, fromDictionary: dict) as! String
        }
        return self
    }
    
    
    func dictionaryRepresentation()->NSDictionary{
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.accessExpire, forKey: kTokenAccessExpire)
        mutableDict.setValue(self.refreshToken, forKey: kTokenRefreshToken)
        mutableDict.setValue(self.accessToken, forKey: kTokenAccessToken)
        return NSDictionary(dictionary: mutableDict)
    }
    
    
    
    func objectOrNilForKey(aKey:AnyObject,fromDictionary dict:NSDictionary)->AnyObject{
        let object = dict.objectForKey(aKey)
        return ((object?.isEqual(NSNull()) == true) ? nil : object)!
    }
    
    
    
    
    public func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(accessExpire, forKey: kTokenAccessExpire)
        aCoder.encodeObject(refreshToken, forKey: kTokenRefreshToken)
        aCoder.encodeObject(accessToken, forKey: kTokenAccessToken)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder){
        
        self.accessExpire = aDecoder.decodeObjectForKey(kTokenAccessExpire) as! NSNumber
        self.refreshToken = aDecoder.decodeObjectForKey(kTokenRefreshToken) as! NSString
        self.accessToken = aDecoder.decodeObjectForKey(kTokenAccessToken) as! NSString
        
    }
    
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let copy = Token(coder: NSCoder())
        if((copy) != nil){
            
            copy?.accessExpire = self.accessExpire
            copy?.refreshToken = self.refreshToken.copyWithZone(zone) as! NSString
            copy?.accessToken = self.accessToken.copyWithZone(zone) as! NSString
        }
        
        return copy!
    }
    
    
    
    

}
