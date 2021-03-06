//
//  MBProgressHUD+LC.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/24.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LC)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end
