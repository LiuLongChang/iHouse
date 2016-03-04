//
//  DataBaseManager.h
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "User.h"




@interface DataBaseManager : NSObject




+(DataBaseManager*)shareInstance;
-(FMDatabaseQueue*)getUserTable;
-(void)insertUserToDB:(User*)user;
-(void)removeUser:(User*)user;




@end
