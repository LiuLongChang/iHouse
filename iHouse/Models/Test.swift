//
//  Test.swift
//  iHouse
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit



let kType : String = "type"





class Test: NSObject {
    
    
    
    var address : String!
    var id : String!
    var location : String!
    var mobile : String!
    var search : String!
    var type : String!
    
    
    
    public  class  func initModelWithDic(dic:NSDictionary)->Test{
        let test = Test()
        test.address = String(dic["address"]!);
        test.id = String(dic["id"]!);
        test.location = String(dic["location"]!);
        test.mobile = String(dic["mobile"]!);
        test.search = String(dic["search"]!);
        test.type = String(dic["type"]!);
        return test
    }

    
    
    
    public func dictionaryRepresentation()->NSDictionary{
        let mutableDict = NSMutableDictionary()
        mutableDict.setValue(self.type, forKey: kType)
        return NSDictionary(dictionary: mutableDict)
    }
    
    
    
    
    
    
    

}
