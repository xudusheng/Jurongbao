//
//  JRBHotPieceView.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/22.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBHotPieceView.h"

@interface JRBHotPieceView()
@property (weak, nonatomic) IBOutlet UIView *circleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *circleHeight;

@end
@implementation JRBHotPieceView

- (void)awakeFromNib{
    self.autoresizingMask =
    //UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleWidth |
    //UIViewAutoresizingFlexibleRightMargin |
    //UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleHeight
    //UIViewAutoresizingFlexibleBottomMargin
    ;
    self.translatesAutoresizingMaskIntoConstraints = YES;
    self.circleView.layer.masksToBounds = YES;
    self.circleView.layer.cornerRadius = 100*0.6/2;
    self.circleView.layer.borderWidth = 2;
    self.circleView.layer.borderColor = [UIColor whiteColor].CGColor;
}


@end
