//
//  ServerNetWorkManager.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/20.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "ServerNetWorkManager.h"
#import "AFNetworking.h"


@implementation ServerNetWorkManager

+(instancetype)shareManager
{
    static ServerNetWorkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

-(void)request:(NSString *)url
        method:(RequestMethod)method
    parameters:(NSDictionary *)paras
  successBlock:(SuccessBlock)returnData
  failureBlock:(FailureBlock)error
{

    switch (method) {
        case GET:
            
            [ServerNetWorkManager getRequest:url parameters:paras successBlock:returnData failureBlock:error];
            break;
        case POST:
            
            [ServerNetWorkManager postRequest:url parameters:paras successBlock:returnData failureBlock:error];
            break;
  
        default:
            break;
    }
}

+ (void)getRequest:(NSString *)url
        parameters:(NSDictionary*)paras
      successBlock:(SuccessBlock)returnData
      failureBlock:(FailureBlock)errorcode
{

    //1.url
    NSString *urlStr = [NSString stringWithFormat:@"%s%@",BASIC_URL,url];
    NSString*username =paras[@"username"];
    
    NSString*fillurl = urlStr;
    if (username.length != 0) {
       fillurl = [NSString stringWithFormat:@"%@?username=%@",urlStr,username];
    }
    
    LCLog(@"%@", fillurl);
    //2
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

    [sessionManager GET:fillurl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //JSON解析
        
         NSDictionary *resultDic = (NSDictionary*)responseObject;
        if (returnData) {
            returnData(resultDic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorcode) {
            errorcode(error.userInfo[@"NSLocalizedDescription"]);
        }
        LCLog(@"%@",error.userInfo[@"NSLocalizedDescription"]);
    }];
   
    
}
+ (void)postRequest:(NSString *)url
        parameters:(NSDictionary*)paras
      successBlock:(SuccessBlock)returnData
      failureBlock:(FailureBlock)errorcode
{
    //1.url
    NSString *urlStr = [NSString stringWithFormat:@"%s%@",BASIC_URL,url];
    
    //2.参数
    NSDictionary *paraDic = paras;
    if (paraDic == nil) {
        errorcode(@"参数不能为空");
        return;
    }
    //转码
//    NSData *dicData = [NSJSONSerialization dataWithJSONObject:paraDic options:NSJSONWritingPrettyPrinted error:nil];
    

    //初始化AFNetworking
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
//    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = 30.0f;  //设置请求超时时间
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
  
    
    //发起请求
    [sessionManager POST:urlStr parameters:paraDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *resultDic = (NSDictionary*)responseObject;

//            NSDictionary*resultDic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        if (returnData) {
            returnData(resultDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorcode) {
            errorcode(error.userInfo[@"NSLocalizedDescription"]);
        }
        LCLog(@"%@",error.userInfo[@"NSLocalizedDescription"]);
    }];
}

- (void)post{


}

@end
