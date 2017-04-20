//
//  UserCount.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "UserCount.h"

@implementation UserCount

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.userID = [value intValue];
    }
    
    if ([key isEqualToString:@"phone"]) {
        self.phoneNum = value;
    }
}

@end
