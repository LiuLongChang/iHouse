//
//  AFHttpTool.h
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"


typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2
};







typedef NS_ENUM(NSInteger, JoyApartmentAPI){
    JoyApartmentAPI_GetList = 1,
    JoyApartmentAPI_Payment = 2
};










@interface AFHttpTool : NSObject


/*
 *
 *
 *
 *  网络工具类单例
 *
 */
+(AFHttpTool*)shareInstance;





/*
*
*
* 接口
*
*
*/

//得到机构列表网络请求


-(void)API:(JoyApartmentAPI)api WithType:(NSString*)type success:(void(^)(id response))success failure:(void(^)(NSError* err))failure;























/*
 *
 *
 * 网络共用类属性
 *
 *
 */
@property(nonatomic,retain)MBProgressHUD * progressHud;







@end
