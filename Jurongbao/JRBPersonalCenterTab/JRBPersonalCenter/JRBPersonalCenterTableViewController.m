//
//  JRBPersonalCenterTableViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/20.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBPersonalCenterTableViewController.h"

@interface JRBPersonalCenterTableViewController ()

@end

@implementation JRBPersonalCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBPersonalCenterTableViewControllerDataInit];
    [self createJRBPersonalCenterTableViewControllerUI];
}
#pragma mark - UI相关
- (void)createJRBPersonalCenterTableViewControllerUI{
    
}

#pragma mark - 网络请求

#pragma mark - 代理方法

#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBPersonalCenterTableViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//CABasicAnimation* rotationAnimation;
//rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//rotationAnimation.duration = 2.0f;
//rotationAnimation.cumulative = YES;
//rotationAnimation.repeatCount = HUGE_VALF;
//rotationAnimation.delegate = self;
//rotationAnimation.removedOnCompletion = NO;
//[self.imgView.layer addAnimation:rotationAnimation forKey:@"red"];
@end
