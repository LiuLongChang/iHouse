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




//+(void)GetListWithDic:(NSDictionary*)dict success:(void(^)(id returnValue))success failure:(void(^)(NSString*errorMsg))failure exception:((^)(NSString* errorMsg))exception{
//    
//    
//    
//    iHouse_APILib * cloud = [[iHouse_APILib alloc] init];
//    cloud.serviceURL = serviceURL;
////    [cloud globalTimelinePostURL: HeadInfoType:<#(ENUM_HEADINFO_TYPE)#> SC:<#(NSString *)#> SV:<#(NSString *)#> paramters:<#(id)#> success:<#^(iHouse_APILib *returnInfo)success#> failure:<#^(iHouse_APILib *returnInfo)failure#> SerException:<#^(iHouse_APILib *returnType)SerException#> NetException:<#^(NSInteger ErrorCode, NSError *ErrorMsg)NetException#>]
//    
//    
//    
//    
//    
//}



+(void)GetListWithDic:(NSDictionary*)dict success:(void(^)(id returnValue))success failure:(void(^)(NSString*errorMsg))failure{
    
    
    
    
    [[AFHttpTool shareInstance] API:JoyApartmentAPI_GetList WithType:@"1" success:^(id response) {
        
       
        
        
        
        
        
        
    } failure:^(NSError *err) {
        
        
        
        
        
        
    }];
    
    
    
}








@end
