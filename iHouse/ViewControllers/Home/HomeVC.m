//
//  HomeVC.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "HomeVC.h"

#import "AFHttpTool.h"





@interface HomeVC ()




@end

@implementation HomeVC


-(void)initVariables{
    self.dataArray = [NSMutableArray array];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"HomeVc";
    self.view.backgroundColor = [UIColor blackColor];
    [self initVariables];
    
    
        
//    [[AFHttpTool shareInstance] API:JoyApartmentAPI_GetList WithType:@"1" success:^(id response) {
//        
//        self.dataArray = response;
//        [_tabView reloadData];
//        
//    } failure:^(NSError *err) {
//       
//    }];
    
    
    [CloudBL GetListWithType:@"1" success:^{
        
        
        
        
        
    } failure:^(NSString *errorMsg) {
        
        
    }];
    
    
}





-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"ID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
    Test * model;
    if (self.dataArray.count != 0) {
       model  = self.dataArray[indexPath.row];
    }
    
    cell.textLabel.text = model.address;
    cell.detailTextLabel.text = model.location;
    
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
