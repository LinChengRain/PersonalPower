//
//  PersonRequest.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/22.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerNetWorkManager.h"

@class PersonRequest;

@protocol PersonRequestDelegate <NSObject>

/**
 登出

 @param request PersonRequest
 @param isSuccess 请求结果状态
 */
- (void)requestWithClass:(PersonRequest*)request logoutState:(BOOL)isSuccess;

/**
 提交

 @param request isSuccess
 @param isSuccess 请求结果状态
 */
- (void)requestWithClass:(PersonRequest*)request submitofState:(BOOL)isSuccess;

- (void)requestWithClass:(PersonRequest *)request userInfo:(NSDictionary*)userInfo;
@end

@interface PersonRequest : NSObject

@property(nonatomic, assign) id<PersonRequestDelegate> delegate;
- (void)logoutWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para;

- (void)submitWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para;
- (void)queryUserInfoaDatasource;

@end
