//
//  PINavigationViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PINavigationViewController.h"

@interface PINavigationViewController ()

@end

@implementation PINavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = [UIColor colorWithRed:82 / 255.0 green:183 / 255.0 blue:249 / 255.0 alpha:1.0];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
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
