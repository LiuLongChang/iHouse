//
//  AppNetAPIClient.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AppNetAPIClient : AFHTTPSessionManager




+(instancetype)sharedClient:(NSTimeInterval)timeInterval serviceURL:(NSString*)serviceURL;




@end
