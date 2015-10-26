//
//  JRBProductDetailViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/24.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBProductDetailViewController.h"
#import "JRBProductDetailSegmentControl.h"
#define itemArray @[@"基本概况", @"项目描述", @"资金保证"]

@interface JRBProductDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productDetailInfoTableView;
@property (nonatomic, strong) UIScrollView * segmentControllContentView;
@property (weak, nonatomic) IBOutlet JRBProductDetailSegmentControl *segmentControl;

@end

@implementation JRBProductDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBProductDetailViewControllerDataInit];
    [self createJRBProductDetailViewControllerUI];
}
#pragma mark - UI相关
- (void)createJRBProductDetailViewControllerUI{
    [self.segmentControl addTarget:self action:@selector(segmentControllSelected:) forControlEvents:UIControlEventValueChanged];
    [self addSegmentControllContentView];
}

- (void)addSegmentControllContentView{//添加分段控制器的内容视图，即UIScroolView
    CGFloat firstSegmentViewHeight = arc4random()%200 + 100;
    CGFloat secondSegmentViewHeight = arc4random()%200 + 100;
    CGFloat thirdSegmentViewHeight = arc4random()%200 + 100;
    CGFloat maxHeight = (firstSegmentViewHeight>secondSegmentViewHeight)?firstSegmentViewHeight:secondSegmentViewHeight;
    maxHeight = maxHeight>thirdSegmentViewHeight?maxHeight:thirdSegmentViewHeight;
    _segmentControllContentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, maxHeight)];
    _segmentControllContentView.contentSize = CGSizeMake(kScreenWidth * 3, maxHeight);
    _segmentControllContentView.showsHorizontalScrollIndicator = NO;
    _segmentControllContentView.showsVerticalScrollIndicator = NO;
    _segmentControllContentView.pagingEnabled = YES;
    _segmentControllContentView.bounces = NO;
    _segmentControllContentView.delegate = self;
    UIView * firstSegmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, firstSegmentViewHeight)];
    UIView * secondSegmentView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, secondSegmentViewHeight)];
    UIView * thirdSegmentView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, thirdSegmentViewHeight)];
    firstSegmentView.backgroundColor = [UIColor redColor];
    secondSegmentView.backgroundColor = [UIColor greenColor];
    thirdSegmentView.backgroundColor = [UIColor blueColor];
    [_segmentControllContentView addSubview:firstSegmentView];
    [_segmentControllContentView addSubview:secondSegmentView];
    [_segmentControllContentView addSubview:thirdSegmentView];
    self.productDetailInfoTableView.tableFooterView = _segmentControllContentView;
}
#pragma mark - 网络请求

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView != self.productDetailInfoTableView) {
        _segmentControl.selectedSegmentIndex = scrollView.contentOffset.x/kScreenWidth;
    }
}
#pragma mark - 点击事件处理
- (void)segmentControllSelected:(JRBProductDetailSegmentControl *)segmentControl{
    [_segmentControllContentView scrollRectToVisible:CGRectMake(kScreenWidth*segmentControl.selectedSegmentIndex, 0, _segmentControllContentView.frame.size.width, _segmentControllContentView.frame.size.height) animated:YES];
}
#pragma mark - 其他私有方法
#pragma mark - 内存管理相关
- (void)JRBProductDetailViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
