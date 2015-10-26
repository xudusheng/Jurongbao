//
//  JRBBannerView.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/23.
//  Copyright © 2015年 truly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRBBannerView : UIView
- (instancetype)initWithURLArray:(NSArray *)URLArray selectBlock:(void (^)(NSInteger selectIndex))selectBlock;

@end
