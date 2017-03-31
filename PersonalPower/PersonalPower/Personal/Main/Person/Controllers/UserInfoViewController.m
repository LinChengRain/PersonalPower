//
//  UserInfoViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/24.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoView.h"
#import "MicroDefine.h"
#import "PersonRequest.h"

@interface UserInfoViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,PersonRequestDelegate>

@property(nonatomic,strong) UserInfoView *userInfoView;
@property(nonatomic,strong) UIButton *userBtn;
@property(nonatomic,strong) NSDictionary *userDic;
@property(nonatomic,strong)PersonRequest *request;
@end

@implementation UserInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initSubview];
    
    [self handleBlock];
}
#pragma mark - 创建子视图
- (void)initSubview
{
    
   self.userInfoView = [[UserInfoView alloc] initWithFrame:CGRectMake(0,64,K_Screen_Width,K_Screen_Height - 64)];
    [self.view addSubview:self.userInfoView];
    
    
    
    self.request = [[PersonRequest alloc] init];
    self.request.delegate = self;
    
 }
#pragma mark - Block Action
- (void)handleBlock
{
    LCWeakSelf(self);
    self.userInfoView.submitBlock = ^(NSDictionary *para){
        LCStrongSelf(self);
        
       
        [self.request submitWithUrlpath:@"/UserInfoController/userinfo_update.json" parameter:para];
    };
    
    
    self.userInfoView.openAlbumBlock = ^(UIButton *useBtn){
        LCLog(@"打开相册");
        
        LCStrongSelf(self);
        
        self.userBtn = useBtn;
        [self handleUserImange];
    };

}
#pragma mark - 获取图片
- (void)handleUserImange
{
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return;
    }
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    ipc.allowsEditing = YES;
    // 4.设置代理
    ipc.delegate = self;
    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];

}

#pragma mark -- UIImagePickerControllerDelegate
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 设置图片
    UIImage* image = info[UIImagePickerControllerOriginalImage];

    [self.userBtn setImage:image forState:UIControlStateNormal];
    
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - PersonRequestDelegate
- (void)requestWithClass:(PersonRequest *)request submitofState:(BOOL)isSuccess
{
    if (isSuccess) {
        
        [MBProgressHUD showMessage:@"提交成功"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
