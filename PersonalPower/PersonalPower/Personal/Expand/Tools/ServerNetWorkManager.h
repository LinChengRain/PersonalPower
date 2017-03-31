//
//  ServerNetWorkManager.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/20.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MicroDefine.h"

typedef enum {
    GET,
    POST
} RequestMethod;
@interface ServerNetWorkManager : NSObject

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^SuccessBlock)(NSDictionary *returnData);

/**
 *  请求失败回调
 *
 *  @param errorCode 回调block
 */
typedef void (^FailureBlock)(NSString *errorCode);

@property(nonatomic,copy)SuccessBlock returnData;
@property(nonatomic,copy)FailureBlock errorCode;

+(instancetype)shareManager;

/**
 网络请求

 @param url 请求地址
 @param method 请求方法：POST/GET
 @param paras 请求参数
 @param returnData 成功的回调
 @param error 失败的回调
 */
-(void)request:(NSString *)url
        method:(RequestMethod)method
    parameters:(NSDictionary*)paras
  successBlock:(SuccessBlock)returnData
  failureBlock:(FailureBlock)error;
@end
