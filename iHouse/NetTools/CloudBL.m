//
//  CloudBL.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "CloudBL.h"
#import "Header.h"

@implementation CloudBL





/**
 *  4.手机账号登录
 *
 *  @param topInfo   手机账号登录信息
 *  @param success   成功返回 NSMutableDictionary
 *  @param failure   失败返回
 *  @param exception 异常返回
 */

+(void)Login_Phone:(NSString*)phoneNum Pwd:(NSString*)pwd success:(void(^)(NSString* HGuid,Token * token,NSString* userName))success failure:(void(^)(NSString* errorMsg))failure{
  
    PostPhoneLoginModel * model = [[PostPhoneLoginModel alloc] init];
    
    model.phone = phoneNum;
    model.password = [pwd encodePassword];
    NSDictionary * dic = model.dictionaryRepresnetation;
    
    
    
    [CloudDao Login_Phone:dic success:^(id returnValue) {
        
        PhoneLoginModel * model = [PhoneLoginModel modelObjectWithDictionary:returnValue];
        success(model.hGUID,model.token,model.userName);
        
        
    } failure:^(NSString *errorMsg) {
        
        failure(errorMsg);
        
    } exception:^(NSString *errorMsg) {
        
        failure(@"网络请求异常");
        
    }];
    
    
    
}






@end
