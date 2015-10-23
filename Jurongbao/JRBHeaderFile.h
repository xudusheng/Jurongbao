//
//  JRBHeaderFile.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/17.
//  Copyright © 2015年 truly. All rights reserved.
//

#ifndef JRBHeaderFile_h
#define JRBHeaderFile_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#define kAppIdentifier [[NSBundle mainBundle]bundleIdentifier]//本应用的bundle identifier
#define IOS6 ([[UIDevice currentDevice] systemVersion].floatValue>=6.0f)
#define IOS7 ([[UIDevice currentDevice] systemVersion].floatValue>=7.0f)
#define IOS8 ([[UIDevice currentDevice] systemVersion].floatValue>=8.0f)

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeigh [UIScreen mainScreen].bounds.size.height

#define kWhiteColor [UIColor whiteColor]//白色
#define kClearColor [UIColor colorWithWhite:1 alpha:0]//透明色

#define kJRBColor_1 [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0]//背景色
#define kJRBColor_2 [UIColor colorWithRed:86.0/255.0 green:86.0/255.0 blue:86.0/255.0 alpha:1.0]//底部菜单栏黑色
#define kJRBColor_3 [UIColor colorWithRed:230.0/255.0 green:69.0/255.0 blue:74.0/255.0 alpha:1.0]//主色调红色
#define kJRBColor_4 [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]//浅灰色
#define kJRBColor_5 [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]//灰色
#define kJRBColor_6 [UIColor colorWithRed:45.0/255.0 green:45.0/255.0 blue:45.0/255.0 alpha:1.0]//文字及标题栏黑色
#define kJRBColor_7 [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0]//底部菜单栏背景色
#define kJRBColor_8 [UIColor colorWithRed:254.0/255.0 green:145.0/255.0 blue:55.0/255.0 alpha:1.0]//列表页按钮黄色


#import "JRBRootViewController.h"
#import "JRBRootTableViewController.h"

#import "JRBEnumFile.h"
#pragma mark - 第三方库


#endif /* JRBHeaderFile_h */

