//
//  JRBLoginTableViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/24.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBLoginTableViewController.h"

@interface JRBLoginTableViewController ()

@end

@implementation JRBLoginTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBLoginTableViewControllerDataInit];
    [self createJRBLoginTableViewControllerUI];
    
}
#pragma mark - UI相关
- (void)createJRBLoginTableViewControllerUI{

}

#pragma mark - 网络请求

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBLoginTableViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
