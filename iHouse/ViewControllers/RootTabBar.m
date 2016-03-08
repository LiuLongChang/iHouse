//
//  RootTabBar.m
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import "RootTabBar.h"

#import "HomeVC.h"
#import "PaymentOfLifeVC.h"
#import "GreenPlantsVC.h"
#import "SettingVC.h"


@interface RootTabBar ()

@end

@implementation RootTabBar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    
    HomeVC * home = [[HomeVC alloc] init];
    UINavigationController * navHome = [[UINavigationController alloc] initWithRootViewController:home];
    
    
    
    PaymentOfLifeVC * pay = [[PaymentOfLifeVC alloc] init];
    UINavigationController * navPay = [[UINavigationController alloc] initWithRootViewController:pay];
    
    
    GreenPlantsVC * green = [[GreenPlantsVC alloc] init];
    UINavigationController * navGreen = [[UINavigationController alloc] initWithRootViewController:green];
    
    
    SettingVC * set = [[SettingVC alloc] init];
    UINavigationController * navSet = [[UINavigationController alloc] initWithRootViewController:set];
    
    
    NSArray * array = @[navHome,navPay,navGreen,navSet];
    
    
    [self setViewControllers:array animated:YES];
    
    
    //self.tabBar.barTintColor = [UIColor cyanColor];
    
    
    
    
    
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
