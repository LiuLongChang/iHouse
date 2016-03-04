//
//  BaseVC.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    

    [self initUI];
    
    
    
}

-(void)initUI{
    
    self.progressHud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:self.progressHud];
    [self.progressHud hide:YES];

    
    //网络工具类持有旋转指示器 便于统一控制
    AFHttpTool * tool = [AFHttpTool shareInstance];
    tool.progressHud = self.progressHud;
    
    
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
