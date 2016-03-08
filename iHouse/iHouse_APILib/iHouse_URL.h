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




/*!
 *  24．获取用户所有设备信息
 */
#define kMyEquipsURL @"/api/my_equips"







//请根据API给出的SC进行配置
#pragma mark - SC

#define KSC  @"1eb3253f3acb44c0a18b0bfbb0dac3d7"




/*!
 *  24．获取用户所有设备信息
 */
#define kMyEquipsSV @"b3975723e47840bcbeb5358b5b617019"




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
