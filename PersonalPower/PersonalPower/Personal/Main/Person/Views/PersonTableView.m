//
//  PersonTableView.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/28.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PersonTableView.h"
#import "MicroDefine.h"

@interface PersonTableView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,strong) UIImageView *headerImageView;
@property(nonatomic,strong) UILabel *titleLabel;
@end
@implementation PersonTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createSubview];
    }
    return self;
}
- (void)createSubview
{

    [self addSubview:self.tableview];
}
- (void)setDataDic:(NSDictionary *)dataDic
{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:dataDic[@"picture"] options:0];
    UIImage *image = [UIImage imageWithData:decodedData];
    self.headerImageView.image = image;
    self.titleLabel.text = dataDic[@"username"];
}
#pragma mark - Lazy method
- (UITableView *)tableview
{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.rowHeight = 44;
    }
    return _tableview;
}

#pragma mark - UITableViewDatasource method
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //标记
    static NSString *identifier = @"cell";
    //初始化cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //单元格复用
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //赋值
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"选中第%ld个单元格",indexPath.row);
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 5, 90, 90)];
    self.headerImageView.backgroundColor = [UIColor redColor];
    self.headerImageView.layer.cornerRadius = 45;
    self.headerImageView.layer.masksToBounds = YES;
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headerImageView.frame)+ 30, 45, 100, 40)];
    self.titleLabel.textColor = [UIColor redColor];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    
    [headerView addSubview:self.titleLabel];
    [headerView addSubview:self.headerImageView];
    
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
