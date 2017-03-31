//
//  RegisterViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/23.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"

@interface RegisterViewController ()<RegisterRequestDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswTextField;
@property (weak, nonatomic) IBOutlet UITextField *againPwdTextField;

@property (nonatomic, strong)RegisterRequest *request;
@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.request = [[RegisterRequest alloc] init];
    self.request.delegate = self;
}
- (IBAction)registerAction:(UIButton *)sender {
    
    [self.request registerWithUrlpath:@"/RegisteredController/registered_post.json" parameter:@{@"username":self.userTextField.text,@"password":self.pswTextField.text}];
}
- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - RegisterRequestDelegate
-(void)requestWithParameters:(NSDictionary *)userInfo userModel:(UserCount *)userModel
{
    if (userModel != nil) {
        LCLog(@"注册成功:%@",userInfo[@"msg"]);
       
        [self backAction:nil];
    }else{
         LCLog(@"注册失败:%@",userInfo[@"msg"]);
    }
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
