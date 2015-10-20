//
//  JRBPersonalCenterHeaderView.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/20.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBPersonalCenterHeaderView.h"
@interface JRBPersonalCenterHeaderView()
@property (weak, nonatomic)IBOutlet UIImageView * out_circleImageView;
@property (weak, nonatomic)IBOutlet UIImageView * in_circleImageView;


@end

@implementation JRBPersonalCenterHeaderView

- (void)awakeFromNib{

    [self addRotationAnimationWithView:_out_circleImageView toValue:(M_PI * 2.0)];
    [self addRotationAnimationWithView:_in_circleImageView toValue:(- M_PI * 2.0)];
}

- (void)addRotationAnimationWithView:(UIView *)view toValue:(CGFloat)toValue{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(toValue);
//    [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 8.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.delegate = self;
    rotationAnimation.removedOnCompletion = NO;
    [view.layer addAnimation:rotationAnimation forKey:@"red"];
}

@end
