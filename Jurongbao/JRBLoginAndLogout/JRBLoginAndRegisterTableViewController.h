//
//  JRBLoginAndRegisterTableViewController.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/17.
//  Copyright © 2015年 truly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRBLoginAndRegisterTableViewController : JRBRootTableViewController

@property (copy, nonatomic)void(^loginBlock)(UIViewController *, BOOL);

@end
