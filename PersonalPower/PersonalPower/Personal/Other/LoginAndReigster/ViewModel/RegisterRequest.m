//
//  RegisterRequest.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/23.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "RegisterRequest.h"


@implementation RegisterRequest

- (void)registerWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para
{

    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];
    
    LCWeakSelf(self);
    [manager request:urlpath method:POST parameters:para successBlock:^(NSDictionary *returnData) {
        
        LCStrongSelf(self);
        LCLog(@"%@", returnData);
        NSString *state = [NSString stringWithFormat:@"%@",returnData[@"state"]];
        if ([state isEqualToString:@"100"]) {
            
            UserCount *model = [[UserCount alloc] initWithDataDic:returnData[@"result"]];
            
            [self judgementWithResultMsg:returnData[@"msg"] userCount:model];
        }else{
            [self judgementWithResultMsg:returnData[@"msg"] userCount:nil];
        }
    } failureBlock:^(NSString *errorCode) {
        
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
