//
//  CloudBL.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CloudBL : NSObject



+(void)GetListWithType:(NSString*)typeStr success:(void(^)(void))success failure:(void(^)(NSString*errorMsg))failure;




@end
