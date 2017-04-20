//
//  EditView.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "EditView.h"
#import "MicroDefine.h"

@interface EditView()

@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UITextField *titleFiled;
@property(nonatomic,strong)UIButton *submitBtn;
@end

@implementation EditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initSubviews];
    }
    return self;
}

#pragma mark - create subview
- (void)initSubviews
{
    //标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.text = @"标题";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [self addSubview:self.titleLabel];
    
    self.titleFiled = [[UITextField alloc] initWithFrame:CGRectZero];
    self.titleFiled.text = @"标题";
    self.titleFiled.font = [UIFont boldSystemFontOfSize:19];
    [self addSubview:self.titleFiled];

    
    //内容
    self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.textView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.textView];
    
    //提交
    self.submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submitBtn.frame = CGRectZero;
    self.submitBtn.backgroundColor = [UIColor greenColor];
    [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.submitBtn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.submitBtn];
    
    //设置约束
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30);
        make.left.equalTo(20);
        make.height.offset(30);
        make.width.offset(60);
    }];

    [self.titleFiled makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30);
        make.left.equalTo(self.titleLabel.right).with.offset(20);
        make.right.equalTo(-20);
        make.height.offset(30);
       
    }];
    
    [self.textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleFiled.bottom).with.offset(20);
        make.left.equalTo(20);
        make.right.equalTo(-20);
        make.height.offset(200);
    }];
    
    [self.submitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.bottom).with.offset(30);
        make.left.equalTo(50);
        make.right.equalTo(-50);
        make.height.offset(30);
    }];
    
    [self.submitBtn.superview layoutIfNeeded];
}

- (void)submitAction:(UIButton*)sender
{
    if (self.submitBlock) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:self.titleFiled.text forKey:@"title"];
        [dic setValue:self.textView.text forKey:@"context"];
        
        self.submitBlock(dic);
    }
}

- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
    
    
    self.submitBtn.layer.cornerRadius  = 15;
    self.submitBtn.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
