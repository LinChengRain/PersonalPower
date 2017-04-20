//
//  WriteRequest.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerNetWorkManager.h"

@class WriteRequest;

@protocol WriteRequestDelegate <NSObject>

/**
 提交

 @param writeRequest writeRequest
 @param isSuccess 请求结果
 */
-(void)writeWithClass:(WriteRequest *)writeRequest submitofState:(BOOL)isSuccess;
@end
@interface WriteRequest : NSObject

@property(nonatomic,assign)id<WriteRequestDelegate> delegate;
-(void)writeWithUrlpath:(NSString *)urlpath parameter:(NSDictionary *)para;


@end
