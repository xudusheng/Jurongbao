//
//  JRBWebProgressView.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/21.
//  Copyright © 2015年 truly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRBWebProgressView : UIView

@property (nonatomic ,assign) float time;
@property (nonatomic ,assign) BOOL isWebEndAnmation;
@property (nonatomic ,assign) BOOL isWebStartAnmation;
@property (nonatomic ,assign) BOOL animationFinish;
@property (nonatomic ,assign) NSInteger yanshi;
@property (nonatomic ,assign) float progress;
@property (nonatomic ,strong) UIView * progressView;
@property (nonatomic ,assign) float progressHeight;
-(void)shouldStartLoadWithRequestProgressAnimation;
-(void)webViewDidFinishLoadProgressAnimation;
-(void)webViewDidStartLoadProgressAnimation;
-(instancetype)initWithFrame:(CGRect)frame progressHeight:(float)height;

@end
