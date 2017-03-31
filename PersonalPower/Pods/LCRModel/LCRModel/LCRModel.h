//
//  LCRModel.h
//  
//
//  Created by LinChengRain on 2016/12/15.
//  Copyright © 2016年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCRModel : NSObject<NSCoding>

-(id)initWithDataDic:(NSDictionary*)data;
- (NSDictionary*)attributeMapDictionary;
- (void)setAttributes:(NSDictionary*)dataDic;
- (NSString *)customDescription;
- (NSString *)description;
- (NSData*)getArchivedData;

- (NSString *)cleanString:(NSString *)str;    //清除\n和\r的字符串


@end
