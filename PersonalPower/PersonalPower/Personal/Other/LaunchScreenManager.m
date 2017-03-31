//
//  LaunchScreenManager.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "LaunchScreenManager.h"
#import "LoginViewController.h"
#import "PITabBarViewController.h"

#import "MicroDefine.h"
@implementation LaunchScreenManager

+ (UIViewController*)launch{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        
        
        LCLog(@"第一次启动");
        
       
        UIViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        UINavigationController *lcNV = [[UINavigationController alloc] initWithRootViewController:loginVC];
        return lcNV;
        
    }else{
        
        BOOL loginState = [[NSUserDefaults standardUserDefaults] valueForKey:@"loginState"];
        if (loginState) {
 
            LCLog(@"已登录，进入主界面");
            PITabBarViewController *tabBarVC = [[PITabBarViewController alloc] init];
            return tabBarVC;
        }else{
            LCLog(@"未登录，进入登录界面");
            UIViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
            UINavigationController *lcNV = [[UINavigationController alloc] initWithRootViewController:loginVC];
            return lcNV;
        }
        
    }
    return nil;
}

+ (void)logint
{
     PITabBarViewController *tabBarVC = [[PITabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;

}
+ (void)logout
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    LoginViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    UINavigationController *lcNV = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = lcNV;
}
@end
