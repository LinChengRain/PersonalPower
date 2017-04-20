//
//  EditView.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SubmitBlock)(NSDictionary *dic);

@interface EditView : UIView

@property(nonatomic,copy)SubmitBlock submitBlock;
@end
