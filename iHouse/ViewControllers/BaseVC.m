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
    

    [self initUI];
    
}


-(void)initUI{
    
    self.progressHud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:self.progressHud];
    [self.progressHud hide:YES];

    
    
    
    
}



-(void)alertWithTitle:(NSString *)titleStr content:(NSString *)content ok:(NSString *)isOk viewController:(UIViewController*)vc{
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:titleStr message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:titleStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:action1];
    [vc presentViewController:alert animated:YES completion:^{
        
    }];
    
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
