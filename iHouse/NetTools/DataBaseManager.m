//
//  DataBaseManager.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "DataBaseManager.h"




static NSString * const userTableName = @"USERTABLE";



static FMDatabaseQueue * databaseQueue = nil;



@implementation DataBaseManager

+(DataBaseManager*)shareInstance{
    static DataBaseManager * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
        [instance getUserTable];
    });
    return instance;
}




-(FMDatabaseQueue*)getUserTable{
    
    
    if (!databaseQueue) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentDirectory = [paths objectAtIndex:0];
        NSString * dbPath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"JoyApartmentDB%@",@"1"]];
        databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
    }
    
    
    if (databaseQueue == nil) {
        NSLog(@"databaseQueue 为空。");
        return nil;
    }
    
    
    
    [databaseQueue inDatabase:^(FMDatabase *db) {
        
        if (![DataBaseManager isTableOK:userTableName withDB:db]) {
            NSString * createTableSQL = @"CREATE TABLE USERTABLE (id integer PRIMARY KEY autoincrement,userid text,name text,portraitUrl text)";
            [db executeUpdate:createTableSQL];
            NSString * createIndexSQL = @"CREATE unique INDEX idx_userid ON USERTABLE(userid)";
            [db executeUpdate:createIndexSQL];
        }
        
    }];
    
    
    return databaseQueue;
}



//存储用户信息
-(void)insertUserToDB:(User*)user{
    
    
    NSString * insertSql = @"REPLACE INTO USERTABLE (userid,name,portraitUrl) VALUES (?,?)";
    FMDatabaseQueue * queue = [[DataBaseManager shareInstance] getUserTable];
    
    [queue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdate:insertSql,user.userId,user.name,user.portraitUrl];
        
    }];
    
    
    
}



//删除用户信息
-(void)removeUser:(User*)user{
    
    NSString * deleteSql = [NSString stringWithFormat:@"DELETE FROM BLACKTABLE WHERE userid=%@",user.userId];
    FMDatabaseQueue * queue = [[DataBaseManager shareInstance] getUserTable];
    if (queue == nil) {
        return;
    }
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:deleteSql];
    }];
    
}













//判断数据库是否存在表
+(BOOL)isTableOK:(NSString*)tableName withDB:(FMDatabase*)db{
    BOOL isOK = NO;
    FMResultSet * rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?",tableName];
    while ([rs next]) {
        NSInteger count = [rs intForColumn:@"count"];
        if (0 == count) {
            isOK = NO;
        }else{
            isOK = YES;
        }
    }
    [rs close];
    return isOK;
}









@end
