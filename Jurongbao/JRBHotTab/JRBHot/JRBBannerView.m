//
//  JRBBannerView.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/23.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBBannerView.h"
#import "UIButton+WebCache.h"

@interface JRBBannerView()<UIScrollViewDelegate>{
    NSInteger _allPage;
    NSInteger _currentPage;
    NSTimer * _time;
}

@property (strong, nonatomic)UIScrollView * scrollBanner;
@property (strong, nonatomic)UIPageControl * pageControl;
@property (copy, nonatomic)void(^selectBlock)(NSInteger selectIndex);

@end

@implementation JRBBannerView
NSInteger interval = 3;

- (instancetype)initWithURLArray:(NSArray *)URLArray selectBlock:(void (^)(NSInteger selectIndex))selectBlock{
    if (!URLArray.count) {
        return nil;
    }else{
        UIImage * bannerDefaultImage = [UIImage imageNamed:@"banner_default"];
        CGFloat bannerHeight = kScreenWidth/bannerDefaultImage.size.width*bannerDefaultImage.size.height;
        NSMutableArray * URLArray_addTwo = [NSMutableArray arrayWithCapacity:0];
        [URLArray_addTwo addObject:[URLArray lastObject]];
        [URLArray_addTwo addObjectsFromArray:URLArray];
        [URLArray_addTwo addObject:[URLArray firstObject]];
        if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, bannerHeight)]) {
            if (selectBlock) {
                self.selectBlock = selectBlock;
            }
            _allPage = URLArray_addTwo.count;
            self.scrollBanner = [self bannerWithURLArray:URLArray_addTwo];
            [self addSubview:self.scrollBanner];
            [self addPageControl];
            _currentPage = 1;
            if (URLArray.count == 1) {
                self.scrollBanner.scrollEnabled = NO;
            }else{
                _time = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
            }
        }
        return self;
    }
}

- (UIScrollView *)bannerWithURLArray:(NSArray *)URLArray{
    UIImage * bannerDefaultImage = [UIImage imageNamed:@"banner_default"];
    CGFloat bannerHeight = kScreenWidth/bannerDefaultImage.size.width*bannerDefaultImage.size.height;
    UIScrollView * scrollBanner = [[UIScrollView alloc]initWithFrame:self.frame];
    scrollBanner.pagingEnabled = YES;
    scrollBanner.showsHorizontalScrollIndicator = NO;
    scrollBanner.showsVerticalScrollIndicator = NO;
    scrollBanner.delegate = self;
    for (int i = 0; i < URLArray.count; i ++) {
        NSString * urlString = URLArray[i];
        UIButton * bannerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        bannerButton.frame = CGRectMake(kScreenWidth*i, 0, kScreenWidth, bannerHeight);
        bannerButton.tag = i;
        [bannerButton sd_setImageWithURL:[NSURL URLWithString:urlString]
                                forState:UIControlStateNormal
                        placeholderImage:bannerDefaultImage];
        //        [bannerButton setImageWithImageName:urlString
        //                                   forState:UIControlStateNormal
        //                                placeholder:bannerDefaultImage];
        [bannerButton addTarget:self action:@selector(bannerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollBanner addSubview:bannerButton];
    }
    scrollBanner.contentSize = CGSizeMake(kScreenWidth*URLArray.count, bannerHeight);
    [scrollBanner setContentOffset:CGPointMake(kScreenWidth, 0)];
    return scrollBanner;
}
- (void)addPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/8, self.frame.size.height/8)];
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.currentPage = 0;
    self.pageControl.center = CGPointMake(kScreenWidth/2, self.frame.size.height*15/16);
    self.pageControl.numberOfPages = _allPage - 2;
    [self.pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint contentOffset = scrollView.contentOffset;
    _currentPage = scrollView.contentOffset.x/kScreenWidth;
    if (contentOffset.x <= 0) {
        [scrollView setContentOffset:CGPointMake((_allPage-2)*kScreenWidth, 0)];
    }else if (contentOffset.x >= (_allPage-1)*kScreenWidth){
        [scrollView setContentOffset:CGPointMake(kScreenWidth, 0)];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_time invalidate];
    _time = nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/kScreenWidth;
    self.pageControl.currentPage = page - 1;
    if (!_time) {
        _time = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
    }
}

- (void)scrollToNextPage{
    [self.scrollBanner scrollRectToVisible:CGRectMake((_currentPage + 1)*kScreenWidth, 0, kScreenWidth, self.frame.size.height) animated:YES];
    if (_currentPage>=_allPage-2) {
        _currentPage = 0;
    }
    self.pageControl.currentPage = _currentPage;
}

#pragma mark - 点击时间
- (void)bannerButtonClick:(UIButton *)bannerButton{//banner
    if (self.selectBlock) {
        NSInteger tag = bannerButton.tag;
        if (tag == 0) {
            tag = _allPage - 2;
        }else if(tag == _allPage - 1){
            tag = 0;
        }else{
            tag -= 1;
        }
        self.selectBlock(tag);
    }
}

- (void)pageControlClick:(UIPageControl *)pageControl{
    [_time invalidate];
    _time = nil;
    [self.scrollBanner scrollRectToVisible:CGRectMake((pageControl.currentPage + 1)*kScreenWidth, 0, kScreenWidth, self.frame.size.height) animated:YES];
    _time = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}

- (void)dealloc{
    self.selectBlock = nil;
    self.pageControl = nil;
}



//- (void)bannerImageRequestWithImageNameArray:(NSString *)imageName{//banner的图片数据请求
//    NSDictionary * oriDic = @{
//                              @"imgName":@[imageName]
//                              };
//    NSString *urlString = @"/account/userLogin";
//
//    OCHttpRequest * request = [[OCHttpRequest alloc]init];
//    [request fetchByWebserviceURLString:urlString jkId:@"600004" dictionary:oriDic hudController:self showHUD:NO HUDText:nil success:^(NSDictionary *successResult) {
//        NSLog(@"successResult = %@", successResult);
//    } failed:^(NSInteger statusCode, NSString *errorDescription) {
//        
//    }];
//}

@end
