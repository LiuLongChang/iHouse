//
//  CloudDao.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "CloudDao.h"
#import "Header.h"

@implementation CloudDao


/*!
 *  4．手机账号登录
 */
#define kPhoneLoginURL @"/api/phone_login"

/*!
 *  4．手机账号登录
 */
#define kPhoneLoginSV @"a3f12d3b0d46406eb6979e2de2d8dddf"



+(void)Login_Phone:(NSDictionary*)dict success:(void(^)(id returnValue))success failure:(void(^)(NSString* errorMsg))failure exception:(void(^)(NSString* errorMsg))exception{
    
    
    iHouse_APILib * cloud = [[iHouse_APILib alloc] init];
    cloud.serviceURL = serviceURL;
    
    
    
    
    [cloud globalTimelinePostURL:kPhoneLoginURL HeadInfoType:HEADINFO_TYPE_ONE SC:KSC SV:kPhoneLoginSV paramters:dict success:^(iHouse_APILib *returnInfo) {
        
        
        
        
        NSLog(@"success:%@",returnInfo.ReturnValue);
        success(returnInfo.ReturnValue);
        
        
    } failure:^(iHouse_APILib *returnInfo) {
        
        NSLog(@"failure:%@ - %@",returnInfo.ResultMessage,returnInfo.ReturnValue);
        
    } SerException:^(iHouse_APILib *returnType) {
        
        NSLog(@"SerException:%@ - %@",returnType.ResultMessage,returnType.ReturnValue);
        NSString * resultMsg = [NSString stringWithFormat:@"%@",returnType.ResultMessage];
        NSString * returnValue = [resultMsg ErrorCode];
        exception(returnValue);
        
        
    } NetException:^(NSInteger ErrorCode, NSError *ErrorMsg) {
        
        NSLog(@"NetException:%ld - %@",ErrorCode,[ErrorMsg description]);
        if (ErrorCode == -1001) {
            exception(@"网络请求超时");
        }else{
            exception(@"网络连接异常");
        }
        
    }];
    
    
}







@end
