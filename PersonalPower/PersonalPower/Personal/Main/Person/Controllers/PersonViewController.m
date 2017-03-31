//
//  PersonViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PersonViewController.h"
#import "Masonry.h"
#import "PersonRequest.h"
#import "LaunchScreenManager.h"

#import "UserInfoViewController.h"

#import "PersonTableView.h"
@interface PersonViewController ()<PersonRequestDelegate>

@property(nonatomic, strong)PersonRequest*personRequest;
@property(nonatomic, strong)PersonTableView *tableview;
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initVariable];
    
    [self initNavigationBar];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self requestData];
}
#pragma mark - Draw UI
- (void)initNavigationBar
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 80, 44);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
    UIButton *editbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    editbutton.frame = CGRectMake(0, 0, 80, 44);
    [editbutton setTitle:@"编辑" forState:UIControlStateNormal];
    [editbutton addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:editbutton];
    self.navigationItem.leftBarButtonItem = leftBtn;
}
#pragma mark - 初始化
- (void)initVariable{
    
    self.personRequest = [[PersonRequest alloc] init];
    self.personRequest.delegate = self;
    
    self.tableview = [[PersonTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableview];
}
- (void)requestData
{

    //获取用户信息
    [self.personRequest queryUserInfoaDatasource];
}
#pragma mark - Click Action
- (void)logoutAction
{
    NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults]valueForKey:@"password"];
//    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    [self.personRequest logoutWithUrlpath:@"/LoginController/logout_post.json"
                                parameter:@{@"username":username,@"password":password}];

}
- (void)editAction
{

    UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}
#pragma mark - PersonRequestDelegate
-(void)requestWithClass:(PersonRequest *)request logoutState:(BOOL)isSuccess
{
    
    if (isSuccess) {
        
        LCLog(@"退出成功,进入登录界面");
        //移除本地化数据
        NSUserDefaults *defatluts = [NSUserDefaults standardUserDefaults];
        NSDictionary *dictionary = [defatluts dictionaryRepresentation];
        for(NSString *key in [dictionary allKeys]){
            [defatluts removeObjectForKey:key];
            [defatluts synchronize];
        }
        
        //退出
        [LaunchScreenManager logout];
    }
    
}
-(void)requestWithClass:(PersonRequest *)request userInfo:(NSDictionary *)userInfo
{
    self.tableview.dataDic = userInfo;
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
