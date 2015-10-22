//
//  JRBHotViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/17.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBHotViewController.h"
#import "JRBHotPieceView.h"
#import "JRBHotTableViewCell.h"
@interface JRBHotViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *hotTableView;

@end

@implementation JRBHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBHotViewControllerDataInit];
    [self createJRBHotViewControllerUI];
}
#pragma mark - UI相关
- (void)createJRBHotViewControllerUI{
    self.hotTableView.tableHeaderView = [self headerView];
}

- (UIView *)headerView{
    CGFloat gap = 10;
    CGFloat width = (kScreenWidth - gap * 3)/2;
    CGFloat height = 100;
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height*2 + gap * 3)];
    headerView.backgroundColor = kOCColor_6;
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 2; j ++) {
            JRBHotPieceView * pieceView = [[[NSBundle mainBundle]loadNibNamed:@"JRBHotPieceView" owner:self options:nil]lastObject];
            CGFloat origin_x = gap + (gap + width)*j;
            CGFloat origin_y = gap + (gap + height)*i;
            pieceView.frame = CGRectMake(origin_x, origin_y, width, height);
            NSLog(@"piece = %@", pieceView);
            [headerView addSubview:pieceView];
        }
    }
    
    NSLog(@"subVIew = %@", headerView.subviews);
    return headerView;
}
#pragma mark - 网络请求

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JRBHotTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JRBHotTableViewCell"];
    return cell;
}
#pragma mark - 点击事件处理

#pragma mark - 其他私有方法

#pragma mark - 内存管理相关
- (void)JRBHotViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
