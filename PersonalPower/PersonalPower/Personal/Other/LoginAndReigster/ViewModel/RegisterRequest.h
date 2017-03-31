//
//  RegisterRequest.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/23.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserCount.h"
#import "ServerNetWorkManager.h"

@class RegisterRequest;

@protocol RegisterRequestDelegate <NSObject>

-(void)requestWithParameters:(NSDictionary*)userInfo userModel:(UserCount*)userModel;

@end
@interface RegisterRequest : NSObject

@property(nonatomic,assign)id<RegisterRequestDelegate>delegate;

- (void)registerWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para;

@end
