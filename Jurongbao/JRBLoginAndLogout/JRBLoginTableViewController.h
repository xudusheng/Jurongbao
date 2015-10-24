//
//  JRBLoginTableViewController.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/24.
//  Copyright © 2015年 truly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRBLoginTableViewController : JRBRootTableViewController

@property (copy, nonatomic)void(^loginBlock)(UIViewController *, BOOL);

@end
