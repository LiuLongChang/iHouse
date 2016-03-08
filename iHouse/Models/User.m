//
//  User.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "User.h"


NSString *const kName = @"Name";
NSString *const kUserId = @"UserId";
NSString *const kPortraitUrl = @"ID";


@implementation User


@synthesize name = _name;
@synthesize userId = _userId;
@synthesize portraitUrl = _portraitUrl;


+(instancetype)modelObjectWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}


-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    self = [super init];
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.name = [self objectOrNilForKey:kName fromDictionary:dict];
        self.userId = [self objectOrNilForKey:kUserId fromDictionary:dict];
        self.portraitUrl = [self objectOrNilForKey:kPortraitUrl fromDictionary:dict];
    }
    
    return self;
}


- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kName];
    [mutableDict setValue:self.userId forKey:kUserId];
    [mutableDict setValue:self.portraitUrl forKey:kPortraitUrl];
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
    
    self.name = [aDecoder decodeObjectForKey:kName];
    self.userId = [aDecoder decodeObjectForKey:kUserId];
    self.portraitUrl = [aDecoder decodeObjectForKey:kPortraitUrl];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:kName];
    [aCoder encodeObject:_userId forKey:kUserId];
    [aCoder encodeObject:_portraitUrl forKey:kPortraitUrl];
}




- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    if (copy) {
        copy.name = [self.name copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.portraitUrl = [self.portraitUrl copyWithZone:zone];
    }
    return copy;
}







@end
