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
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBPersonalCenterTableViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
