//
//  JRBProductListTableViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/20.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBProductListTableViewController.h"
#import "JRBProductListTableViewCell.h"
@interface JRBProductListTableViewController ()

@end

@implementation JRBProductListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self JRBProductListTableViewControllerDataInit];
    [self createJRBProductListTableViewControllerUI];
    
}
#pragma mark - UI相关
- (void)createJRBProductListTableViewControllerUI{

}

#pragma mark - 网络请求

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JRBProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JRBProductListTableViewCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showJRBProductDetailViewController" sender:nil];
}

#pragma mark - 点击事件处理
- (IBAction)showPurchaseButton:(UIButton *)button {
}


#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBProductListTableViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
