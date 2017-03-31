//
//  HomeRequest.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/22.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServerNetWorkManager.h"
@class HomeRequest;
@protocol HomeRequestDelegate <NSObject>

- (void)requestWithClass:(HomeRequest*)request logoutState:(BOOL)isSuccess;
@end

@interface HomeRequest : NSObject

@property(nonatomic, assign) id<HomeRequestDelegate> delegate;


@end
