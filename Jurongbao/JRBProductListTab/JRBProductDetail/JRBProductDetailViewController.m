//
//  JRBProductDetailViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/24.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBProductDetailViewController.h"
#import "DZNSegmentedControl.h"

#define itemArray @[@"基本概况", @"项目描述", @"资金保证"]
@interface JRBProductDetailViewController ()<UITableViewDataSource, UITableViewDelegate, DZNSegmentedControlDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productDetailInfoTableView;
@property (weak, nonatomic) IBOutlet UIView *segmentedControlBgView;
@property (nonatomic, strong) DZNSegmentedControl * segmentedControl;

@end

@implementation JRBProductDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self JRBProductDetailViewControllerDataInit];
    [self createJRBProductDetailViewControllerUI];
}
#pragma mark - UI相关
- (void)createJRBProductDetailViewControllerUI{
    self.segmentedControl.showsCount = NO;
    self.segmentedControl.showsGroupingSeparators = YES;
    [self.segmentedControlBgView addSubview:self.segmentedControl];
    [self addSegmentControllContentView];
}

- (void)addSegmentControllContentView{//添加分段控制器的内容视图，即UIScroolView
    CGFloat firstSegmentViewHeight = arc4random()%200 + 100;
    CGFloat secondSegmentViewHeight = arc4random()%200 + 100;
    CGFloat thirdSegmentViewHeight = arc4random()%200 + 100;
    CGFloat maxHeight = (firstSegmentViewHeight>secondSegmentViewHeight)?firstSegmentViewHeight:secondSegmentViewHeight;
    maxHeight = maxHeight>thirdSegmentViewHeight?maxHeight:thirdSegmentViewHeight;
    UIScrollView * segmentControllContentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, maxHeight)];
    segmentControllContentView.contentSize = CGSizeMake(kScreenWidth * 3, maxHeight);
    segmentControllContentView.pagingEnabled = YES;
    segmentControllContentView.showsHorizontalScrollIndicator = NO;
    segmentControllContentView.showsVerticalScrollIndicator = NO;
    segmentControllContentView.bounces = NO;
    segmentControllContentView.delegate = self;
    UIView * firstSegmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, firstSegmentViewHeight)];
    UIView * secondSegmentView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, secondSegmentViewHeight)];
    UIView * thirdSegmentView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, thirdSegmentViewHeight)];
    firstSegmentView.backgroundColor = [UIColor redColor];
    secondSegmentView.backgroundColor = [UIColor greenColor];
    thirdSegmentView.backgroundColor = [UIColor blueColor];
    [segmentControllContentView addSubview:firstSegmentView];
    [segmentControllContentView addSubview:secondSegmentView];
    [segmentControllContentView addSubview:thirdSegmentView];
    self.productDetailInfoTableView.tableFooterView = segmentControllContentView;
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"contentOffset = %@", NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView != _productDetailInfoTableView) {
        [_segmentedControl setSelected:YES];
        _segmentedControl.selectedSegmentIndex = scrollView.contentOffset.x/kScreenWidth;
//        [_segmentedControl setTitleColor:kJRBColor_3 forState:UIControlStateNormal];
//        [_segmentedControl setTintColor:kJRBColor_3 forSegmentAtIndex:_segmentedControl.selectedSegmentIndex];
    }
}

#pragma mark - DZNSegmentedControlDelegate
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view{
    return UIBarPositionBottom;
}

#pragma mark - 点击事件处理
- (void)selectedSegment:(DZNSegmentedControl *)control{
    NSLog(@"分段选择 选中  %ld", (long)control.selectedSegmentIndex);
}
#pragma mark - 其他私有方法
- (DZNSegmentedControl *)segmentedControl{
    if (!_segmentedControl){
        _segmentedControl = [[DZNSegmentedControl alloc] initWithItems:itemArray];
        _segmentedControl.delegate = self;
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.bouncySelectionIndicator = YES;
        [_segmentedControl setTitleColor:[UIColor colorWithRed:0.91f green:0.24f blue:0.31f alpha:1.00f] forState:UIControlStateSelected];//字体选中颜色
        [_segmentedControl setTintColor:[UIColor colorWithRed:0.91f green:0.24f blue:0.31f alpha:1.00f]];//滑线颜色
        [_segmentedControl addTarget:self action:@selector(selectedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
#pragma mark - 内存管理相关
- (void)JRBProductDetailViewControllerDataInit{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
