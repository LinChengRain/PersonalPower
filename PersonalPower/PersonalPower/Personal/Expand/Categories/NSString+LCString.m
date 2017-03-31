//
//  NSString+LCString.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/22.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "NSString+LCString.h"

@implementation NSString (LCString)

+ (NSString *)lc_stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}
@end
