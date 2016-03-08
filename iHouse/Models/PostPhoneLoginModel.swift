//
//  PostPhoneLoginModel.swift
//  iHouse
//
//  Created by langyue on 16/3/7.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit



let kPostPhoneLoginModelPhone = "phone"
let kPostPhoneLoginModelPassword = "password"




class PostPhoneLoginModel: NSObject,NSCopying,NSCoding {
    
    var phone : NSString?
    var password : NSString?
    
    
    
    class func modelObjectWithDictionary(dict : NSDictionary)->PostPhoneLoginModel{
        return PostPhoneLoginModel.init(dict: dict)
    }
    
    
    
    
    convenience init(dict: NSDictionary) {
        self.init(coder: NSCoder())!
        
        if(dict.isKindOfClass(NSDictionary)){
            self.phone = self.objectOrNilForKey(kPostPhoneLoginModelPhone, fromDictionary: dict) as? NSString
            self.password = self.objectOrNilForKey(kPostPhoneLoginModelPassword, fromDictionary: dict) as? NSString
        }
    }
    
    
    func dictionaryRepresnetation()->NSDictionary{
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.phone, forKey: kPostPhoneLoginModelPhone)
        mutableDict.setValue(self.password, forKey: kPostPhoneLoginModelPassword)
        return NSDictionary(dictionary: mutableDict)
    }
    
    
    override var description: String {
        return NSString(format: "%@", self.dictionaryRepresnetation()) as String
    }
    
    
    
    func objectOrNilForKey(aKey:AnyObject ,fromDictionary dict:NSDictionary)->AnyObject{
        
        
        let object = dict.objectForKey(aKey)
        return (object?.isEqual(NSNull()) == true ? nil : object)!
        
        
    }
    
    
    
    override init() {
        
        super.init()
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        self.phone = aDecoder.decodeObjectForKey(kPostPhoneLoginModelPhone) as? NSString
        self.password = aDecoder .decodeObjectForKey(kPostPhoneLoginModelPassword) as? NSString
        
    }
    
    
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.phone, forKey: kPostPhoneLoginModelPhone)
        aCoder.encodeObject(self.password, forKey: kPostPhoneLoginModelPassword)
    }
    
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = PostPhoneLoginModel(coder: NSCoder())
        if ((copy) != nil) {
            copy?.phone = self.phone?.copyWithZone(zone) as? NSString
            copy?.password = self.password?.copyWithZone(zone) as? NSString
        }
        return copy!
    }
    
    
    
    
    
    
    
    
    

}
