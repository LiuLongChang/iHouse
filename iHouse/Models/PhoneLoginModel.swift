//
//  PhoneLoginModel.swift
//  iHouse
//
//  Created by langyue on 16/3/8.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit


let kPhoneLoginModelHGUID = "HGUID"
let kPhoneLoginModelToken = "Token"
let kPhoneLoginModelUserName = "UserName"



class PhoneLoginModel: NSObject,NSCoding,NSCopying {
    
    
    
    var hGUID : NSString?
    var token :Token?
    var userName : NSString?
    
    
    
    class func modelObjectWithDictionary(dict:NSDictionary)->PhoneLoginModel{
        return PhoneLoginModel(dict: dict)
    }
    
    
    
    
    convenience init(dict:NSDictionary){
        self.init()
        if dict.isKindOfClass(NSDictionary) {
            self.hGUID = self.objectOrNilForKey(kPhoneLoginModelHGUID, fromDictionary: dict) as? NSString
            self.token = Token().initWithDictionary(dict)
            self.userName = self.objectOrNilForKey(kPhoneLoginModelUserName, fromDictionary: dict) as? NSString
        }
    }
    
    
    
    override init() {
        super.init()
    }
    
    
    
    func dictionaryRepresentation()->NSDictionary{
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.hGUID, forKey: kPhoneLoginModelHGUID)
        mutableDict.setValue(self.token, forKey: kPhoneLoginModelToken)
        mutableDict.setValue(self.userName, forKey: kPhoneLoginModelUserName)
        return NSDictionary(dictionary: mutableDict)
    }
    
    
    
    
    
    override var description: String {
        return NSString(format: "%@", self.dictionaryRepresentation()) as String
    }
    
    
    
    
    func objectOrNilForKey(aKey:AnyObject,fromDictionary dict:NSDictionary)->AnyObject{
        let object = dict.objectForKey(aKey)
        
        return object == nil ? NSNull() : object!
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.hGUID = aDecoder.decodeObjectForKey(kPhoneLoginModelHGUID) as? NSString
        self.token = aDecoder.decodeObjectForKey(kPhoneLoginModelToken) as? Token
        self.userName = aDecoder.decodeObjectForKey(kPhoneLoginModelUserName) as? NSString
    }
    
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(hGUID, forKey: kPhoneLoginModelHGUID)
        aCoder.encodeObject(token, forKey: kPhoneLoginModelToken)
        aCoder.encodeObject(userName, forKey: kPhoneLoginModelUserName)
        
    }
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = PhoneLoginModel()
        
            copy.hGUID = self.hGUID?.copyWithZone(zone) as? NSString
            copy.token = self.token?.copyWithZone(zone) as? Token
            copy.userName = self.userName?.copyWithZone(zone) as? NSString
        
        return copy
        
    }
    
    
}
