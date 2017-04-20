//
//  PITabBarViewController.m
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/21.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "PITabBarViewController.h"

#import "PINavigationViewController.h"

#import "HomeViewController.h"
#import "PersonViewController.h"
#import "WriteViewController.h"


@interface PITabBarViewController ()

@end


@implementation PITabBarViewController
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initTabBarViewControllers];
}

- (void) initTabBarViewControllers
{
   
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewControllers:homeVC title:@"首页" unSelectImage:@"tabBar_home_Normal" selectedImage:@"tabBar_home_Selected"];
    
    WriteViewController *writeVC = [[WriteViewController alloc] init];
    [self addChildViewControllers:writeVC title:@"创作" unSelectImage:@"tabBar_writer_Normal" selectedImage:@"tabBar_writer_Selected"];
    
    PersonViewController *personVC =  [[PersonViewController alloc] init];
    [self addChildViewControllers:personVC title:@"个人" unSelectImage:@"tabBar_person_Normal" selectedImage:@"tabBar_person_Selected"];

}
- (void)addChildViewControllers:(UIViewController *)viewController title:(NSString *)title unSelectImage:(NSString *)unSelectImage selectedImage:(NSString *)selectedImage
{
    //设置标题
    viewController.title = title;
    
    //设置normal的图标
    viewController.tabBarItem.image = [UIImage imageNamed:unSelectImage];
    
    //设置selected的图标
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    PINavigationViewController *piVC = [[PINavigationViewController alloc] initWithRootViewController:viewController];
    [self addChildViewController:piVC];
}
@end
