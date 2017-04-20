//
//  WriteViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "WriteViewController.h"
#import "EditViewController.h"

@interface WriteViewController ()

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationBar];
}

- (void)initNavigationBar
{
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, 80, 40);
    [writeBtn setImage:[UIImage imageNamed:@"navigationBar_write"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(writeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:writeBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - Click Action
- (void)writeAction:(UIButton*)btn
{
    EditViewController *editVC = [[EditViewController alloc] init];
    [self.navigationController pushViewController:editVC animated:YES];
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
