//
//  UserInfoView.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/24.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SubmitBlock)(NSDictionary *para);//基本信息
typedef void(^OpenAlbumBlock)(UIButton *useBtn);//配置图像

@interface UserInfoView : UIView

@property(nonatomic,copy)SubmitBlock submitBlock;
@property(nonatomic,copy)OpenAlbumBlock openAlbumBlock;
@end
