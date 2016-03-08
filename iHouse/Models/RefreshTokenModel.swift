//
//  RefreshTokenModel.swift
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit


let kRefreshTokenModelHGUID = "HGUID";
let kRefreshTokenModelToken = "Token";





class RefreshTokenModel: NSObject,NSCoding,NSCopying {
    
    var hGUID : NSString!
    var token : Token!
    
    
    
    
    
    override var description: String {
        return NSString(format: "%@", self.dictionaryRepresentation()) as String
    }
    
    
    class func modelObjectWithDictionary(dict:NSDictionary)->RefreshTokenModel{
        return (RefreshTokenModel().initWithDictionary(dict))
    }
    
    
    override init() {
        super.init()
        
    }
    
    
    func initWithDictionary(dict:NSDictionary)->RefreshTokenModel{
        if(dict.isKindOfClass(NSDictionary.classForCoder())){
            self.hGUID = self.objectOrNilForKey(kTokenAccessToken, fromDictionary: dict) as! NSString
            self.token = self.objectOrNilForKey(kTokenRefreshToken, fromDictionary: dict) as! Token
        }
        return self
    }
    
    
    func dictionaryRepresentation()->NSDictionary{
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.hGUID, forKey: kRefreshTokenModelHGUID)
        mutableDict.setValue(self.token, forKey: kRefreshTokenModelToken)
        return NSDictionary(dictionary: mutableDict)
    }
    
    
    
    func objectOrNilForKey(aKey:AnyObject,fromDictionary dict:NSDictionary)->AnyObject{
        let object = dict.objectForKey(aKey)
        return ((object?.isEqual(NSNull()) == true) ? nil : object)!
    }
    
    
    
    
    public func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(hGUID, forKey: kTokenAccessExpire)
        aCoder.encodeObject(token, forKey: kTokenRefreshToken)
    }
    
    
    
    required init?(coder aDecoder: NSCoder){
        
        self.hGUID = aDecoder.decodeObjectForKey(kTokenAccessExpire) as! NSString
        self.token = aDecoder.decodeObjectForKey(kTokenRefreshToken) as! Token
        
    }
    
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let copy = RefreshTokenModel(coder: NSCoder())
        if((copy) != nil){
            
            copy?.hGUID = self.hGUID
            copy?.token = self.token.copyWithZone(zone) as! Token
            
        }
        
        return copy!
    }
    

    
    
    
    
    
    
    

}
