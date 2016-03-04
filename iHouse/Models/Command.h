//
//  Command.h
//  iHouse
//
//  Created by langyue on 16/3/4.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject



@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSNumber *direction;
@property (nonatomic, strong) NSString *iD;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *toMessageID;
@property (nonatomic, strong) NSNumber *time;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;




@end
