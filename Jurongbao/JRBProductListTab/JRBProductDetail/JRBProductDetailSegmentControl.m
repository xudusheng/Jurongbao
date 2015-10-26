//
//  JRBProductDetailSegmentControl.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/25.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBProductDetailSegmentControl.h"
@interface JRBProductDetailSegmentControl()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;

@end
@implementation JRBProductDetailSegmentControl

- (void)awakeFromNib{
    _segmentedControl.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                             NSForegroundColorAttributeName: kJRBColor_3};
    [_segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                               NSForegroundColorAttributeName: kJRBColor_6};
    [_segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [_segmentedControl addTarget:self action:@selector(segmentControllSelected:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)segmentControllSelected:(UISegmentedControl *)segmentControl{
    _selectedSegmentIndex = segmentControl.selectedSegmentIndex;
    [UIView animateWithDuration:0.3 animations:^{
        self.leadingConstraint.constant = kScreenWidth/3 * _selectedSegmentIndex;

    }];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex{
    _selectedSegmentIndex = selectedSegmentIndex;
    _segmentedControl.selectedSegmentIndex = _selectedSegmentIndex;
    [UIView animateWithDuration:0.3 animations:^{
        self.leadingConstraint.constant = kScreenWidth/3 * _selectedSegmentIndex;
    }];
}
@end
