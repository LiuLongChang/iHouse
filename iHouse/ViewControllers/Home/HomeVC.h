//
//  HomeVC.h
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "BaseVC.h"

@interface HomeVC : BaseVC<UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UITableView *_tabView;
    
    
}


@property(nonatomic,retain)NSMutableArray * dataArray;





@end
