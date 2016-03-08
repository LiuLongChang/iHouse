//
//  CloudBL.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

@interface CloudBL : NSObject



+(void)Login_Phone:(NSString*)phoneNum Pwd:(NSString*)pwd success:(void(^)(NSString* HGuid,Token * token,NSString* userName))success failure:(void(^)(NSString* errorMsg))failure;





@end
