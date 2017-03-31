//
//  LoginRequest.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerNetWorkManager.h"

#import "UserCount.h"
@protocol LoginRequestDelegate <NSObject>

- (void)requestWithParameters:(NSDictionary*)userInfo userModel:(UserCount*)userModel;

@end
@interface LoginRequest : NSObject

@property(nonatomic,assign)id<LoginRequestDelegate>delegate;

-(void)requestWithUrlpath:(NSString*)urlpath parameter:(NSDictionary *)para;
@end
