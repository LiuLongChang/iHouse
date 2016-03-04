//
//  CloudBL.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "CloudBL.h"
#import "Header.h"

@implementation CloudBL



+(void)GetListWithType:(NSString*)typeStr success:(void(^)(void))success failure:(void(^)(NSString*errorMsg))failure{
    
    
    Test *  model = [[Test alloc] init];
    model.type = typeStr;
    NSDictionary * listDic = [model dictionaryRepresentation];
    
    [CloudDao GetListWithDic:listDic success:^(id returnValue) {
        
        success();
        
    } failure:^(NSString *errorMsg) {
        
        failure(errorMsg);
        
    }];
    
}





@end
