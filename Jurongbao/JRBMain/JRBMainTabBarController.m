//
//  JRBMainTabBarController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/11.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBMainTabBarController.h"
#import "JRBLoginTableViewController.h"//登录登出

@interface JRBMainTabBarController ()<UITabBarControllerDelegate>{
    NSInteger _currentItemIndex;
    NSInteger _willSelelctIndex;
}

@end

@implementation JRBMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self JRBMainTabBarControllerDataInit];
    [self createJRBMainTabBarControllerUI];
}

#pragma mark - UI相关
- (void)createJRBMainTabBarControllerUI{
    UIStoryboard *JRBHotTab = [UIStoryboard storyboardWithName:@"JRBHotTab" bundle:nil];
    UIStoryboard *JRBProductListTab = [UIStoryboard storyboardWithName:@"JRBProductListTab" bundle:nil];
    UIStoryboard *JRBPersonalCenterTab = [UIStoryboard storyboardWithName:@"JRBPersonalCenterTab" bundle:nil];
    UIStoryboard *JRBMoreTab = [UIStoryboard storyboardWithName:@"JRBMoreTab" bundle:nil];
    
    UINavigationController *JRBHotNav = [JRBHotTab instantiateViewControllerWithIdentifier:@"JRBHotNavigationController"];
    UINavigationController *JRBProductListNav = [JRBProductListTab instantiateViewControllerWithIdentifier:@"JRBProductListNavigationController"];
    UINavigationController *JRBPersonalCenterNav = [JRBPersonalCenterTab instantiateViewControllerWithIdentifier:@"JRBPersonalCenterNavigationController"];
    UINavigationController *JRBMoreNav = [JRBMoreTab instantiateViewControllerWithIdentifier:@"JRBMoreNavigationController"];
    JRBHotNav.navigationBar.translucent = NO;
    JRBProductListNav.navigationBar.translucent = NO;
    JRBPersonalCenterNav.navigationBar.translucent = NO;
    JRBMoreNav.navigationBar.translucent = NO;
    [self.tabBar setTranslucent:NO];
    self.viewControllers = @[JRBHotNav, JRBProductListNav, JRBPersonalCenterNav, JRBMoreNav];
    self.tabBar.selectedImageTintColor = kJRBColor_4;
    
    NSArray * selectedImages = @[@"ico_hot_on", @"ico_list_on", @"ico_user_on", @"ico_about_on"];
    NSArray * itemArray = self.tabBar.items;
    for (int i = 0; i < itemArray.count; i ++) {
        UITabBarItem * item = itemArray[i];
        [item setSelectedImage:[UIImage imageNamed:selectedImages[i]]];
    }
    
    //设置导航栏颜色
    [[UINavigationBar appearance] setBarTintColor:kJRBColor_6];
    //设置导航栏标题颜色
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:kWhiteColor forKey:NSForegroundColorAttributeName];
    [UINavigationBar appearance].titleTextAttributes = dict;
    
    [[UITabBar appearance] setBarTintColor:kJRBColor_7];
}

#pragma mark - 网络请求

#pragma mark - 代理方法
#pragma mark UITabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:@"个人中心"]) {
        [self showLoginViewController:YES];
    }else{
        NSArray * items = tabBar.items;
        _currentItemIndex = [items indexOfObject:item];
    }
}
#pragma mark UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSArray * controllers = tabBarController.customizableViewControllers;
    _willSelelctIndex = [controllers indexOfObject:viewController];
    if (_willSelelctIndex == 2) {
        return NO;
    };
    return YES;
}


#pragma mark - 点击事件处理

#pragma mark - 其他私有方法
- (void)showLoginViewController:(BOOL)fromTab{//跳转到登陆界面
    if (!fromTab) {
        _willSelelctIndex = _currentItemIndex;
    }
    UIStoryboard * main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController * LRNC = [main instantiateViewControllerWithIdentifier:@"JRBLoginNavigationController"];
    JRBLoginTableViewController * LRVC = LRNC.viewControllers[0];
    [LRVC setLoginBlock:^(UIViewController * login, BOOL success) {
        if (success) {
            _currentItemIndex = _willSelelctIndex;
        }else{
            if (_currentItemIndex == 2) {
                _currentItemIndex = 0;
            }
        }
        [self setSelectedIndex:_currentItemIndex];
    }];
    
    if (IOS8) {
        LRVC.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    }
    [self presentViewController:LRNC animated:YES completion:nil];
}
#pragma mark - 内存管理相关
- (void)JRBMainTabBarControllerDataInit{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
