//
//  PersonRequest.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/22.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PersonRequest.h"

@implementation PersonRequest

- (void)queryUserInfoaDatasource
{
    
    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];
    NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];

    LCWeakSelf(self);
    [manager request:@"/UserInfoController/userinfo.json" method:GET parameters:@{@"username":username} successBlock:^(NSDictionary *returnData) {
        
        LCStrongSelf(self);
        
        NSString*state= [NSString stringWithFormat:@"%@",returnData[@"state"]];
        if ([state isEqualToString:@"0"]) {
            
            NSDictionary *resultDic = returnData[@"result"];
            if ([self.delegate respondsToSelector:@selector(requestWithClass:userInfo:)]) {
                [self.delegate requestWithClass:self userInfo:resultDic];
            }
        }
    } failureBlock:^(NSString *errorCode) {
        
    }];

}
- (void)logoutWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para{
    
    LCLog(@"%@", para);
    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];
    LCWeakSelf(self);
    [manager request:urlpath method:POST parameters:para successBlock:^(NSDictionary *returnData) {
        LCStrongSelf(self);
        
        LCLog(@"%@", returnData);
        
        BOOL state = NO;
        
        NSString *result = [NSString stringWithFormat:@"%@",returnData[@"state"]];
        //205:退出成功
        if ( [result isEqualToString:@"205"]) {
            state = YES;
        }
        
        if ([self.delegate respondsToSelector:@selector(requestWithClass:logoutState:)]) {
            [self.delegate requestWithClass:self logoutState:state];
        }
        
    } failureBlock:^(NSString *errorCode) {
        
    }];
}

- (void)submitWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para
{
//    LCLog(@"%@", para);
    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];
    LCWeakSelf(self);
    [manager request:urlpath method:POST parameters:para successBlock:^(NSDictionary *returnData) {
        
        LCStrongSelf(self);
        LCLog(@"%@", returnData);
        
        BOOL state = NO;
        
        NSString *result = [NSString stringWithFormat:@"%@",returnData[@"state"]];
        //205:退出成功
        if ( [result isEqualToString:@"0"]) {
            state = YES;
        }

        if ([self.delegate respondsToSelector:@selector(requestWithClass:submitofState:)]) {
            [self.delegate requestWithClass:self submitofState:state];
        }
    } failureBlock:^(NSString *errorCode) {
        
    }];

}


@end
