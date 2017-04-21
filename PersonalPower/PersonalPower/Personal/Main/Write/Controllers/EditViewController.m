//
//  EditViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/4/18.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "EditViewController.h"
#import "EditView.h"
#import "WriteRequest.h"

@interface EditViewController ()<WriteRequestDelegate>
@property(nonatomic,strong)WriteRequest *writeRequest;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubview];
    
    self.writeRequest = [[WriteRequest alloc] init];
    self.writeRequest.delegate = self;
}

- (void)initSubview
{
    EditView *editView = [[EditView alloc] initWithFrame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height - 64)];
    [self.view addSubview:editView];

    LCWeakSelf(self);
    editView.submitBlock = ^(NSDictionary *dic) {
        LCStrongSelf(self);
        LCLog(@"%@", dic);
        NSString *title = dic[@"title"];
        NSString *context = dic[@"context"];
        if (title.length == 0 && context.length == 0)
        {
            [MBProgressHUD showError:@"没有需要提交的文章"];
            return;
        }
        if (title.length == 0) {
             [MBProgressHUD showError:@"标题不能为空"];
            return;
        }
        
         NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
        int userId = [[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] intValue];
        
        NSMutableDictionary *paraDic = [NSMutableDictionary dictionary];
        [paraDic setDictionary:dic];
        [paraDic setValue:username forKey:@"author"];
        [paraDic setValue:[self currentTime] forKey:@"createtime"];
        [paraDic setValue:@(userId) forKey:@"userId"];
        
        [self.writeRequest writeWithUrlpath:@"/ArticleController/submitArticle.json" parameter:paraDic];

    };
}

#pragma mark - 
- (void)writeWithClass:(WriteRequest *)writeRequest submitofState:(BOOL)isSuccess
{
    if (isSuccess) {
        [MBProgressHUD showSuccess:@"发表成功！"];
    }else{
     [MBProgressHUD showSuccess:@"发表失败！"];
    }
}
- (NSString *)currentTime
{
    　NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    
    NSDate *datenow = [NSDate date];
    
    
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    
    LCLog(@"nowtimeStr =  %@",nowtimeStr);
    return nowtimeStr;
}
@end
