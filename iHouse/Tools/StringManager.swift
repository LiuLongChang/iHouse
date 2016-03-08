//
//  StringManager.swift
//  iHouse
//
//  Created by langyue on 16/3/6.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit



extension NSString{
    
    
    /*  生成错误码信息(根据协议错误码定义)
    *
    *   @return 错误码字典集
    */
    
    
    public func createBaseWebErrorCodeAndMsg()->NSDictionary{
        
        let errorCodeAndMsg = ["1000":"成功", 
            "2001":"请求缺少必须参数",
            "2002":"Sc或Sv未授权",
            "2003":"手机号被占用",
            "2004":"错误的手机号格式",
            "2005":"发送短信失败",
            "2006":"错误的手机注册验证码",
            "2007":"用户不存在或者密码错误",
            "2008":"您输入的账号不存在",
            "2009":"错误的重置密码验证码",
            "2010":"令牌错误",
            "2010.1":"访问令牌错误",
            "2010.2":"访问令牌过期",
            "2010.3":"刷新令牌错误",
            "2011":"未注册的手机号或登录动态码错误",
            "2012":"用户反馈错误",
            "2012.1":"文字内容超长",
            "2012.2":"图片大小超过范围",
            "2012.3":"图片格式不支持",
            "2020":"密码错误",
            "2020.1":"密码长度必需为6-16位非空字符",
            "2020.2":"新旧密码不能相同",
            "2030":"设备关联错误",
            "2030.1":"您已添加过该设备",
            "2030.2":"设备已被其他人添加",
            "2030.3":"设备不存在",
            "2030.4":"您不是设备的创建者",
            "2030.5":"不存在与设备的关联关系",
            "2030.6":"您名下暂无设备信息",
            "2031":"分享失败",
            "2031.1":"您已向该好友发出过邀请",
            "2031.2":"没有此分享邀请或已失效",
            "2031.3":"不能向自己发出邀请",
            "2031.4":"发送的“拒绝”或“接受”无效"]
        
            return errorCodeAndMsg
        
        
    }
    
    
    
    public func ErrorCode()->NSString{
        var dic = NSDictionary()
        dic = self.createBaseWebErrorCodeAndMsg()
        var errorStr = ""
        errorStr = dic[self]  as! String
        return errorStr
    }
    
    
    
    //MARK: 密码加密算法
    func SHA1(topInfo:NSString,const_Str:NSString,isLower:Bool)->NSString{
        
        let tempMd5 = NSString(format: "%@%@", const_Str,topInfo)
        let md5 = self .MD5(tempMd5, encode: NSUTF8StringEncoding, isLower: true)
        
        
        let tempSH = NSString(format: "%@%@", md5,topInfo)
        
        
        let cstr : UnsafePointer = tempSH.cStringUsingEncoding(NSUTF8StringEncoding)
        let data : NSData = NSData(bytes: cstr, length: tempSH.length)
        
        
        var digest  = [CUnsignedChar](count: Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
        CC_SHA1(data.bytes, CC_LONG(data.length), UnsafeMutablePointer(digest))
        
        let outPut = NSMutableString(capacity:  Int( CC_SHA1_DIGEST_LENGTH * 2))
        
        for (var i = 0;i < Int(CC_SHA1_DIGEST_LENGTH); i++){
            
            outPut.appendFormat("%02x", digest[i])
            
        }
        
        if isLower {
            return outPut.lowercaseString
        }else{
            return outPut.uppercaseString
        }
        
    }
    
    
    
    
    func MD5(topInfo:NSString,encode:NSStringEncoding,isLower:Bool)->NSString{
        let data : NSData = topInfo.dataUsingEncoding(encode)!
        let myByte  = data.bytes;
        
        var result =  [CUnsignedChar](count: 16, repeatedValue: 0)
        

        CC_MD5( myByte, CC_LONG(data.length), UnsafeMutablePointer(result));
        let hash = NSMutableString()
        for ( var i = 0 ; i < 16 ; i++ ){
            
            //_ = result[i]
            
            
            hash.appendFormat("%02X", result[i])
        }
        
        if isLower {
            return hash.lowercaseString
        }else{
            return hash.uppercaseString
        }
    }
    
    
    
    func encodePassword()->NSString{
        let passwordToken = "-6Qg5TyljKlKD~qLu,Y22!UR++4Kep+$"
        return self.SHA1(self, const_Str: passwordToken, isLower: true)
    }
    
    
    
    
    
    
    
}
