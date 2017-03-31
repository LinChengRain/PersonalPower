//
//  UserInfoView.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/24.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "UserInfoView.h"
#import "MicroDefine.h"
#import "UserInfoViewController.h"


@interface UserInfoView()

@property(nonatomic,strong)UITextField *nicknameTextField;
@property(nonatomic,strong)UITextField *ageTextField;
@property(nonatomic,strong)UITextField *phoneTextField;
@property(nonatomic,strong)UIButton *userBtn;
@property(nonatomic,strong)UIImageView *userImageView;
@property(nonatomic,strong)UIButton *submitBtn;
@end
@implementation UserInfoView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
       
        //创建子视图
        [self createSubviews];
    }
    return self;
}
#pragma mark - 初始化子视图
- (void)createSubviews
{
    //用户头像
//    self.se = [[UIImageView alloc] init];
//    self.userImageView.backgroundColor = [UIColor redColor];
//    [self addSubview:self.userImageView];
    self.userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.userBtn.backgroundColor = [UIColor redColor];
    [self.userBtn addTarget:self action:@selector(userBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.userBtn];
    //昵称
    self.nicknameTextField = [[UITextField alloc] init];
    self.nicknameTextField.textColor = [UIColor redColor];
    self.nicknameTextField.placeholder = @"昵称";
    self.nicknameTextField.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.nicknameTextField];
    //年龄
    self.ageTextField = [[UITextField alloc] init];
    self.ageTextField.textAlignment = NSTextAlignmentCenter;
    self.ageTextField.placeholder = @"年龄";
    [self addSubview:self.ageTextField];
    //电话
    self.phoneTextField = [[UITextField alloc] init];
    self.phoneTextField.textAlignment = NSTextAlignmentCenter;
    self.phoneTextField.placeholder = @"电话";
    [self addSubview:self.phoneTextField];
    
    //提交按钮
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.submitBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitBtn];
    
    
    [self configRestrain];
}

//配置约束
- (void)configRestrain
{
    [self.userBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(30);
        make.centerX.equalTo(self);
        make.size.equalTo(90);
    }];
     //更新约束
    [self.userBtn.superview layoutIfNeeded];
    [self.nicknameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userBtn.bottom).with.offset(20);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(30);
    }];
    
    [self.ageTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nicknameTextField.bottom).with.offset(20);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);

        make.height.equalTo(30);
    }];

    [self.phoneTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageTextField.bottom).with.offset(20);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(30);
    }];
    
    [self.submitBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self).offset(-50);
        make.left.equalTo(self).offset(50);
        make.right.equalTo(self).offset(-50);

        make.height.equalTo(30);
    }];

   
}
#pragma mark - Click Action
- (void)submitAction
{
    NSString *nick = self.nicknameTextField.text;
    NSString *age = self.ageTextField.text;
    NSString *phone = self.phoneTextField.text;
    
    NSString *userData;
    if (self.userBtn.imageView.image != nil) {
       NSData* data = UIImageJPEGRepresentation(self.userBtn.imageView.image,0.5);
        userData = [data base64Encoding];
    }
     NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    NSDictionary *dic = @{@"nickname":nick,
                          @"age":age,
                          @"phone":phone,
                          @"picture":userData,
                          @"pic_name":@"user_image",
                          @"username":username
                          };
   
    if (self.submitBlock) {
         self.submitBlock(dic);
    }
}
- (void)userBtnAction:(UIButton*)btn
{
    if (self.openAlbumBlock) {
        self.openAlbumBlock(btn);
    }
    
}
- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
    
    
    self.userBtn.layer.cornerRadius  = 45;
    self.userBtn.clipsToBounds = YES;
}


@end
