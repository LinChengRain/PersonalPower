//
//  MicroDefine.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/20.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#ifndef MicroDefine_h
#define MicroDefine_h

/*****************服务连接*****************/
//172.30.100.137
#define BASIC_URL "http://localhost:8080/appServerWeb"

/*****************Block****************/
#define LCWeakSelf(type)  __weak typeof(type) weak##type = type
#define LCStrongSelf(type)  __strong typeof(type) type = weak##type


#define K_Screen_Width [UIScreen mainScreen].bounds.size.width
#define K_Screen_Height [UIScreen mainScreen].bounds.size.height

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "NSString+LCString.h"
#import "Masonry.h"

/******************DEBUG log日志******************/

#ifdef DEBUG
#define LCString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define LCLog(...) printf("%s: %s 第%d行: %s\n\n",[[NSString lc_stringDate] UTF8String],[LCString UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

#else
#define LCLog(...)


//#define USERDEFAULTS [NSUserDefaults standardUserDefaults]



//颜色值
#define LCRGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
#endif
#endif /* MicroDefine_h */
