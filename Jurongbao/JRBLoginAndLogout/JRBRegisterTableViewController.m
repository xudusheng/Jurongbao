//
//  JRBRegisterTableViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/24.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBRegisterTableViewController.h"

@interface JRBRegisterTableViewController ()

@end

@implementation JRBRegisterTableViewController
NSInteger const  InvitationCodeSession = 4;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBRegisterTableViewControllerDataInit];
    [self createJRBRegisterTableViewControllerUI];
}
#pragma mark - UI相关
- (void)createJRBRegisterTableViewControllerUI{
    
}

#pragma mark - 网络请求

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return (section == InvitationCodeSession)?40:10;
}
#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBRegisterTableViewControllerDataInit{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
