//
//  iHouse_APILib.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Header.h"

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


@interface iHouse_APILib : NSObject



/*
*   服务器返回的结果码
*/
@property(readwrite,nonatomic,strong)NSString * Result;
/*
 *   服务器返回的编码
 */
@property(readwrite,nonatomic,strong)NSString * ResultMessage;
/*
 *   服务器返回的具体信息
 */
@property(readwrite,nonatomic,strong)NSString * ReturnValue;
/*
 *   系统时间戳
 */
@property(readwrite,nonatomic,assign)long TS;
/*
 *   超时时间 不设置默认10秒
 */
@property(nonatomic,assign)NSTimeInterval timeInterval;
/*
 *   服务器主地址 不设置默认为调试服务器
 */
@property(nonatomic,strong)NSString* serviceURL;


/*
*   取消网络请求
*
*   @param serviceURL 服务器地址
*   @param timeInterval 超时时间
*
*/
+(void)cancelAllOperations:(NSString*)serviceURL timeInterval:(NSTimeInterval)timeInterval;



/*
*   发出网络请求
*   @param postURL  网络请求使用的POST URL地址
*   @param HeadInfoType 选择当前使用的HEADINFO版本 当前版本请使用HEADINFO_TYPE_ONE
*   @param SC           SC
*   @param SV           SV
*   @param parameters   协议中的输入内容
*   @param success      成功返回
*   @param failure      失败返回
*   @param SerException 服务器异常返回
*   @param NetException 网络异常
*
*/


-(void)globalTimelinePostURL:(NSString*)postURL HeadInfoType:(ENUM_HEADINFO_TYPE)HeadInfoType SC:(NSString*)SC SV:(NSString*)SV paramters:(id)paramters success:(void(^)(iHouse_APILib* returnInfo))success failure:(void(^)(iHouse_APILib*returnInfo))failure SerException:(void(^)(iHouse_APILib* returnType))SerException NetException:(void(^)(NSInteger ErrorCode,NSError  *ErrorMsg))NetException;









































@end
