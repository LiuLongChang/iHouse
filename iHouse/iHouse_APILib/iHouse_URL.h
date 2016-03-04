//
//  iHouse_URL.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#ifndef iHouse_URL_h
#define iHouse_URL_h






#define kSDebugBaseURL @"http://intellihousedev.chinacloudapp.cn"   //调试



/*!
 *  8．访问令牌刷新
 */
#define kRefreshTokenURL @"/api/refresh_token"



/**
 *  选择使用第几版主协议HeadInfo
 */
typedef NS_OPTIONS(NSUInteger, ENUM_HEADINFO_TYPE){
    /**
     *  不使用HeadInfo
     */
    HEADINFO_TYPE_NONE = 1,
    /**
     *  使用第一版
     */
    HEADINFO_TYPE_ONE  = 2,
};



static NSString *serviceURL = kSDebugBaseURL;









#endif /* iHouse_URL_h */
