//
//  LoginViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/20.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "LoginViewController.h"
#import "PITabBarViewController.h"
#import "LoginRequest.h"
#import "LaunchScreenManager.h"


@interface LoginViewController ()<LoginRequestDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic,strong)LoginRequest *request;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //登录验证
    self.request = [[LoginRequest alloc] init];
    //设置代理
    self.request.delegate = self;

   
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
/// MARK: Click Action
- (IBAction)loginAction:(UIButton *)sender {
    
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *urlpath = @"/LoginController/login_post.json";
    
    if (username.length != 0 && password.length != 0) {
        
        NSDictionary *dic = @{@"username":username,
                              @"password":password
                              };
        //提交登录请求
        [self.request requestWithUrlpath:urlpath parameter:dic];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - LoginRequestDelegate
- (void)requestWithParameters:(NSDictionary *)userInfo userModel:(UserCount *)userModel
{
    if (userInfo == nil) {
        
        LCLog(@"%@",userInfo[@"msg"]);
    }else{
    
        LCLog(@"登录成功");
        
        [MBProgressHUD showSuccess:@"登录成功"];
        
        //登录成功
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loginState"];
        [[NSUserDefaults standardUserDefaults] setValue:userModel.username forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:userModel.password forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] setValue:@(userModel.userID) forKey:@"id"];
//        [[NSUserDefaults standardUserDefaults] setValue:userModel.token forKey:@
//         "token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            //切换到主界面
            [LaunchScreenManager logint];
        });
    }
   
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
