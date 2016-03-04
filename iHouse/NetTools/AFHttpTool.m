//
//  AFHttpTool.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "AFHttpTool.h"
#import "StringManager.h"
#import "AFNetworking.h"

#import "Header.h"



#define Server @"http://auto360.langyue.org/api/"



#define AppPostId @"84cb1bf82adac469e7b7d5702c27e7f9"
#define AppPostKey @"211c0341d4d645a32a4a653733d9f6d5"











@implementation AFHttpTool



//生成网络请求类单例
+(instancetype)shareInstance{
    static AFHttpTool * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AFHttpTool alloc] init];
    });
    return instance;
}


//生成加密字符串
+(NSString*)obtainAppSecretWithDic:(NSDictionary*)dic{
    
    NSString *appStr;
    if(dic.count == 0 || dic == nil)
    {
        appStr = [NSString stringWithFormat:@"appId=%@&appKey=%@",AppPostId,AppPostKey];
    }else{
        NSDictionary *dict = (NSDictionary *) dic;
        NSArray *keys= [dict allKeys];
        NSMutableArray *parAry = [[NSMutableArray alloc]init];
        for(NSString *key in keys)
        {
            NSString *value = [dict valueForKey:key];
            NSString *para = [NSString stringWithFormat:@"%@=%@",key,value];
            [parAry addObject:para];
        }
        
        NSArray *newAry = [parAry sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];
        
        NSString *paras = newAry[0];
        for(int i=1;i<newAry.count;i++)
        {
            NSString *par = newAry[i];
            paras = [NSString stringWithFormat:@"%@&%@",paras,par];
        }
        appStr = [NSString stringWithFormat:@"%@&appId=%@&appKey=%@",paras,AppPostId,AppPostKey];
    }
    return [StringManager MD5:appStr];
    
}


/*
 *   统一网络处理函数
 */
-(void)requestWithApi:(JoyApartmentAPI)api  method:(RequestMethodType)methodType url:(NSString*)url params:(NSDictionary*)params success:(void(^)(id response))success failure:(void(^)(NSError* err))failure{
    
    NSURL * baseURL = [NSURL URLWithString:Server];
    
    AFHTTPSessionManager * mgr = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * para = [AFHttpTool obtainAppSecretWithDic:params];
    
    [mgr.requestSerializer setValue:para forHTTPHeaderField:@"AppSecret"];
    [mgr.requestSerializer setValue:AppPostId forHTTPHeaderField:@"AppId"];
    [mgr.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    [mgr.requestSerializer setValue:[NSString stringWithFormat:@"%f",version] forHTTPHeaderField:@"User-Agent"];
    
    
    
    AFHttpTool * tool = [AFHttpTool shareInstance];
    [tool.progressHud show:YES];
    
    
    switch (methodType) {
            
            
            
        case RequestMethodTypeGet:
        {
            
            [mgr GET:url parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    
                    
//                    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    
                    
                    
                    
                    
                    
                    
                }
                
                [tool.progressHud hide:YES afterDelay:2];
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (failure) {
                    failure(error);
                }
                
                [tool.progressHud hide:YES afterDelay:2];
                
            }];
            
        }
            break;
            
        case RequestMethodTypePost:
        {
            
            //POST请求
            [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    
                    
                    
                    //1.======================获取XX列表网络请求
                    if (api == JoyApartmentAPI_GetList) {
                        NSMutableArray * dataArray = [NSMutableArray array];
                        NSArray * arr = dict[@"data"];
                        for (NSDictionary * dic in arr) {
                            Test * tes = [Test initModelWithDic:dic];
                            [dataArray addObject:tes];
                            
                        }
                        success(dataArray);
                    }

                    
                    
                    
                    
                    
                    
                }
                
                [tool.progressHud hide:YES afterDelay:2];
                
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
                
                [tool.progressHud hide:YES afterDelay:2];
            }];
            
            
        }
            break;
            
            
        default:
            break;
    }
    
    
}






//=========================================//
//=========================================//
//=========================================//









-(void)API:(JoyApartmentAPI)api WithType:(NSString*)type success:(void(^)(id response))success failure:(void(^)(NSError* err))failure{
    NSDictionary * params = @{@"type":type};
    
    [[AFHttpTool shareInstance] requestWithApi:api method:RequestMethodTypePost url:@"orgSelectByType" params:params success:success failure:failure];
    
}























@end
