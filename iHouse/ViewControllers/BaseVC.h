//
//  BaseVC.h
//  JoyApartment
//
//  Created by langyue on 16/3/3.
//  Copyright © 2016年 langyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface BaseVC : UIViewController



@property(nonatomic,retain)MBProgressHUD * progressHud;







-(void)alertWithTitle:(NSString *)titleStr content:(NSString *)content ok:(NSString *)isOk viewController:(UIViewController*)vc;









@end
