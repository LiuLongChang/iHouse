//
//  HeadInfo.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "HeadInfo.h"
#import "Utils_DeviceInfo.h"
#import "Utils_UserDefaultInfo.h"
#import "Utils_AppInfo.h"
#import "Utils_Other.h"


@implementation HeadInfo


+(NSString*)getHeadInfo{
    
    NSString * Agent = [Utils_DeviceInfo GetMobileDeviceName];
    NSString * AgentID = [Utils_UserDefaultInfo GetMobileIdentifer];
    
    
    
    NSString * OsVer = [Utils_DeviceInfo GetDeviceVersion];
    NSString * Os = [Utils_DeviceInfo GetDeviceSystemName];
    
    
    
    //App字段不可改动
    NSString *App = @"IntelliHouse";
    NSString *AppVer = [Utils_AppInfo GetAppShortVersion];
    NSString *AppID = [Utils_AppInfo GetAppIdentifier];
    
    NSString *account = [Utils_UserDefaultInfo GetUserIdentifer:@"UnknowUser"];
    
    NSString *language = [Utils_DeviceInfo GetSystemLanguage];
    NSString *locale = [Utils_DeviceInfo GetSystemLocale];
    
    NSString *Token = [Utils_UserDefaultInfo GetUserDeviceToken:@"UnKnownToken"];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:Agent forKey:@"Agent"];
    [dic setObject:AgentID forKey:@"AgentID"];
    [dic setObject:Os forKey:@"Os"];
    [dic setObject:OsVer forKey:@"OsVer"];
    [dic setObject:App forKey:@"App"];
    [dic setObject:AppVer forKey:@"AppVer"];
    [dic setObject:AppID forKey:@"AppID"];
    [dic setObject:account forKey:@"Account"];
    [dic setObject:language forKey:@"Language"];
    [dic setObject:locale forKey:@"Locale"];
    [dic setObject:Token forKey:@"Token"];
    
    NSDictionary *headInfoDic = [NSDictionary dictionaryWithDictionary:dic];
    NSString *queryString = [Utils_Other queryStringValue:headInfoDic];
    return queryString;

    
    
    
    
}




@end
