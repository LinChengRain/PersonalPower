//
//  WriteRequest.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "WriteRequest.h"

@implementation WriteRequest

- (void)writeWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para
{
    LCLog(@"%@", para);
    ServerNetWorkManager *manager = [ServerNetWorkManager shareManager];
    LCWeakSelf(self);
    [manager request:urlpath method:POST parameters:para successBlock:^(NSDictionary *returnData) {
        LCStrongSelf(self);
        
        LCLog(@"%@", returnData);
        
        NSString *state = [NSString stringWithFormat:@"%@",returnData[@"state"]];
        BOOL isSuccess = NO;
        
        if ([state isEqualToString:@"0"]) {
            isSuccess = YES;
        }
        if ([self.delegate respondsToSelector:@selector(writeWithClass:submitofState:)]) {
            
            [self.delegate writeWithClass:self submitofState:isSuccess];
        }
    } failureBlock:^(NSString *errorCode) {
        
    }];
}
@end
