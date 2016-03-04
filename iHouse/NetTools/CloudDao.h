//
//  CloudDao.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CloudDao : NSObject



+(void)GetListWithDic:(NSDictionary*)dict success:(void(^)(id returnValue))success failure:(void(^)(NSString*errorMsg))failure;



@end
