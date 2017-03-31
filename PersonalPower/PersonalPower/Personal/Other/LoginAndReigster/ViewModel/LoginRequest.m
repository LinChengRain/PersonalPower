//
//  LoginRequest.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "LoginRequest.h"


typedef enum {
    Success,
    Failure,
    Error
}RequestType;

@interface LoginRequest ()

@end
@implementation LoginRequest

/**
 登录处理

 @param urlpath 访问路径
 @param para 请求参数
 */
- (void)requestWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para
{
    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];

    LCWeakSelf(self);
    
    [manager request:urlpath method:POST parameters:para successBlock:^(NSDictionary *returnData) {
        
        LCStrongSelf(self);
        
        LCLog(@"%@",returnData);
        NSString* state = [NSString stringWithFormat:@"%@",returnData[@"state"]];
        NSString* msg = returnData[@"msg"];
        
        //state：1登录成功  0失败
        if ([state isEqualToString:@"200"]) {
            NSDictionary *dic = returnData[@"result"];
            UserCount *usermodel = [[UserCount alloc] initWithDataDic:dic];
            
            [self judgementWithResultMsg:msg userCount:usermodel];
        }else{
            [self judgementWithResultMsg:msg userCount:nil];
        }

        
        
    } failureBlock:^(NSString *errorCode) {
        
         LCStrongSelf(self);
        
        [self judgementWithResultMsg:errorCode userCount:nil];
    }];
}

- (void)judgementWithResultMsg:(NSString*)msg userCount:(UserCount*)userCount;
{
    
    if ([self.delegate respondsToSelector:@selector(requestWithParameters:userModel:)]) {
        [ self.delegate requestWithParameters:@{@"msg":msg} userModel:userCount];
    }
}
@end
