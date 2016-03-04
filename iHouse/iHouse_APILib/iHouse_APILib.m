//
//  iHouse_APILib.m
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "iHouse_APILib.h"


NSString *const kiAndon_CloudResult = @"Result";
NSString *const kiAndon_CloudResultMessage = @"ResultMessage";
NSString *const kiAndon_CloudReturnValue = @"ReturnValue";
NSString *const kiAndon_CloudTS = @"TS";



@interface iHouse_APILib ()


- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;



@end


@implementation NSString (NSString_Extended)

- (NSString *)urlencode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    unsigned long sourceLen = strlen((const char *)source);
    for (unsigned long i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}
@end




@implementation iHouse_APILib


@synthesize Result = _Result;
@synthesize ResultMessage = _ResultMessage;
@synthesize ReturnValue = _ReturnValue;
@synthesize TS = _TS;






+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.Result = [self objectOrNilForKey:kiAndon_CloudResult fromDictionary:dict];
        self.ResultMessage = [self objectOrNilForKey:kiAndon_CloudResultMessage fromDictionary:dict];
        self.ReturnValue = [self objectOrNilForKey:kiAndon_CloudReturnValue fromDictionary:dict];
        self.TS = [[self objectOrNilForKey:kiAndon_CloudTS fromDictionary:dict] longValue];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.Result forKey:kiAndon_CloudResult];
    [mutableDict setValue:self.ResultMessage forKey:kiAndon_CloudResultMessage];
    [mutableDict setValue:self.ReturnValue forKey:kiAndon_CloudReturnValue];
    [mutableDict setValue:[NSNumber numberWithLong:self.TS] forKey:kiAndon_CloudTS];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.Result = [aDecoder decodeObjectForKey:kiAndon_CloudResult];
    self.ResultMessage = [aDecoder decodeObjectForKey:kiAndon_CloudResultMessage];
    self.ReturnValue = [aDecoder decodeObjectForKey:kiAndon_CloudReturnValue];
    self.TS = [aDecoder decodeIntForKey:kiAndon_CloudTS];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_Result forKey:kiAndon_CloudResult];
    [aCoder encodeObject:_ResultMessage forKey:kiAndon_CloudResultMessage];
    [aCoder encodeObject:_ReturnValue forKey:kiAndon_CloudReturnValue];
    [aCoder encodeInteger:_TS forKey:kiAndon_CloudTS];
}

- (id)copyWithZone:(NSZone *)zone
{
    iHouse_APILib *copy = [[iHouse_APILib alloc] init];
    
    if (copy) {
        copy.Result = [self.Result copyWithZone:zone];
        copy.ResultMessage = [self.ResultMessage copyWithZone:zone];
        copy.ReturnValue = [self.ReturnValue copyWithZone:zone];
        copy.TS = self.TS;
    }
    
    return copy;
}






+(void)cancelAllOperations:(NSString *)serviceURL timeInterval:(NSTimeInterval)timeInterval{
    
    AFHTTPSessionManager * manager = [AppNetAPIClient sharedClient:timeInterval serviceURL:serviceURL];
    [manager.operationQueue cancelAllOperations];
    
    
    
    
}





-(void)globalTimelinePostURL:(NSString *)postURL HeadInfoType:(ENUM_HEADINFO_TYPE)HeadInfoType SC:(NSString *)SC SV:(NSString *)SV paramters:(id)paramters success:(void (^)(iHouse_APILib *))success failure:(void (^)(iHouse_APILib *))failure SerException:(void (^)(iHouse_APILib *))SerException NetException:(void (^)(NSInteger, NSError *))NetException{
    
    
    
    NSString * URLString = @"";
    switch (HeadInfoType) {
        case HEADINFO_TYPE_ONE:
            URLString = [NSString stringWithFormat:@"%@?%@",postURL,[HeadInfo getHeadInfo]];
            break;
            
        case HEADINFO_TYPE_NONE:
            URLString = postURL;
            break;
            
        default:
            
            URLString = [NSString stringWithFormat:@"%@?%@",postURL,[HeadInfo getHeadInfo]];
            
            break;
    }
    
    
    NSMutableDictionary * temcontentDic = [[NSMutableDictionary alloc] initWithDictionary:paramters];
    [temcontentDic setObject:SC forKey:@"SC"];
    [temcontentDic setObject:SV forKey:@"SV"];
    
    NSData * contentJsonData = [NSJSONSerialization dataWithJSONObject:temcontentDic options:kNilOptions error:nil];
    NSString * contentString = [[NSString alloc] initWithData:contentJsonData encoding:NSUTF8StringEncoding];
    
    
    
    NSDictionary * contentDic = @{@"content": contentString};
    
    if (_timeInterval == 0) {
        _timeInterval = 10;
    }
    
    if (_serviceURL == nil || [_serviceURL isEqualToString:@""]) {
        _serviceURL = kSDebugBaseURL;
    }
    
    
    
    [[AppNetAPIClient sharedClient:_timeInterval serviceURL:_serviceURL] POST:URLString parameters:contentDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
        iHouse_APILib * iHouseModel = [iHouse_APILib modelObjectWithDictionary:responseObject];
        if ([@"" isEqualToString:iHouseModel.ResultMessage] || [@"" isEqualToString:iHouseModel.ResultMessage]) {
            
            PostRefreshTokenModel * model = [[PostRefreshTokenModel alloc] init];
            model.uN = [Utils_UserDefaultInfo GetUserIdentifer:nil];
            model.refreshToken = [Utils_UserDefaultInfo GetUserRefreshToken:nil];
            NSDictionary * dict = [model dictionaryRepresentation];
            
            
            [[AppNetAPIClient sharedClient:_timeInterval serviceURL:_serviceURL] POST:kRefreshTokenURL parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                
                iHouse_APILib * model = [iHouse_APILib modelObjectWithDictionary:responseObject];
                
                
                //刷新令牌错误
                if ([@"" isEqualToString:model.ResultMessage] ) {
                    
                    [Utils_UserDefaultInfo SetUserDeviceToken:nil];
                    [Utils_UserDefaultInfo SetUserIdentifer:nil];
                    
                    
                    
                    
                }else{
                    
                    //刷新成功 重新请求
                    NSDictionary * dic = (NSDictionary*)model.ReturnValue;
                    RefreshTokenModel * resultModel = [RefreshTokenModel modelObjectWithDictionary:dic];
                    [Utils_UserDefaultInfo SetUserAccessKey:resultModel.token.accessToken];
                    [Utils_UserDefaultInfo SetUserRefreshToken:resultModel.token.refreshToken];
                    [self globalTimelinePostURL:postURL HeadInfoType:HeadInfoType SC:SC SV:SV paramters:paramters success:success failure:failure SerException:SerException NetException:NetException];
                    
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                //刷新令牌失败 跳转到登录
                
                [Utils_UserDefaultInfo SetUserDeviceToken:nil];
                [Utils_UserDefaultInfo SetUserIdentifer:nil];
                
                
                
                
            }];
            
            
        }else{
            
            switch (iHouseModel.Result.intValue) {
                case 1:
                    success(iHouseModel);
                    break;
                    
                case 2:
                    failure(iHouseModel);
                    break;
                    
                case 3:
                    SerException(iHouseModel);
                    break;
                    
                default:
                    failure(iHouseModel);
                    break;
            }
            
            
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NetException(error.code,error);
        
    }];
    
    
}



@end
