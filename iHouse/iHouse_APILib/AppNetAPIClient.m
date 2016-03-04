//
//  AppNetAPIClient.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "AppNetAPIClient.h"

@implementation AppNetAPIClient



+(instancetype)sharedClient:(NSTimeInterval)timeInterval serviceURL:(NSString*)serviceURL{
    
    static AppNetAPIClient * sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        sharedClient = [[AppNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:serviceURL]];
        sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sharedClient.securityPolicy.allowInvalidCertificates = YES;
        sharedClient.requestSerializer.timeoutInterval = timeInterval;
        
    });
    return sharedClient;
}





@end
