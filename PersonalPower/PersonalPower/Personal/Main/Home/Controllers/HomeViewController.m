//
//  HomeViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "HomeViewController.h"

#import "LoginViewController.h"

#import "HomeRequest.h"

@interface HomeViewController ()<HomeRequestDelegate>

@property(nonatomic,strong)HomeRequest *homeRequest;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeRequest = [[HomeRequest alloc] init];
    self.homeRequest.delegate = self;
    // Do any additional setup after loading the view.
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
