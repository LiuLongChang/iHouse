//
//  CloudDao.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"




@interface CloudDao : NSObject




+(void)Login_Phone:(NSDictionary*)dict success:(void(^)(id returnValue))success failure:(void(^)(NSString* errorMsg))failure exception:(void(^)(NSString* errorMsg))exception;





@end
