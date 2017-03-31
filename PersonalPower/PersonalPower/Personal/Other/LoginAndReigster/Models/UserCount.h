//
//  UserCount.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PIBaseModel.h"

@interface UserCount : PIBaseModel

@property(nonatomic,copy) NSString *username;//用户名
@property(nonatomic,copy) NSString *password;//密码
@property(nonatomic,assign) int age;//年龄
@property(nonatomic,copy) NSString *state;//登录状态
@property(nonatomic,copy) NSString *phoneNum;//手机号
@property(nonatomic,copy) NSString *token;//验证令牌
@end
