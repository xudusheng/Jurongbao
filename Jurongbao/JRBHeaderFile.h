//
//  JRBHeaderFile.h
//  Jurongbao
//
//  Created by wangrongchao on 15/10/17.
//  Copyright © 2015年 truly. All rights reserved.
//

#ifndef JRBHeaderFile_h
#define JRBHeaderFile_h

#define kAppIdentifier [[NSBundle mainBundle]bundleIdentifier]//本应用的bundle identifier
#define IOS6 ([[UIDevice currentDevice] systemVersion].floatValue>=6.0f)
#define IOS7 ([[UIDevice currentDevice] systemVersion].floatValue>=7.0f)
#define IOS8 ([[UIDevice currentDevice] systemVersion].floatValue>=8.0f)

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeigh [UIScreen mainScreen].bounds.size.height

#define kOCColor_1 [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]
#define kOCColor_2 [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]
#define kOCColor_3 [UIColor colorWithRed:34.0/255.0 green:34.0/255.0 blue:34.0/255.0 alpha:1.0]
#define kOCColor_4 [UIColor colorWithRed:234.0/255.0 green:63.0/255.0 blue:79.0/255.0 alpha:1.0]
#define kOCColor_5 [UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:1.0]
#define kOCColor_6 [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]
#define kOCColor_7 [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1.0]
#define kOCColor_8 [UIColor colorWithRed:246.0/255.0 green:200.0/255.0 blue:201.0/255.0 alpha:1.0]
#define kOCColor_9 [UIColor colorWithRed:58.9/255.0 green:177.0/255.0 blue:66.0/255.0 alpha:1.0]
#define kOCColor_10 [UIColor colorWithRed:11.0/255.0 green:172.0/255.0 blue:211.0/255.0 alpha:1.0]
#define kOCColor_11 [UIColor colorWithRed:255.0/255.0 green:97.0/255.0 blue:56.0/255.0 alpha:1.0]


#import "JRBRootViewController.h"
#import "JRBRootTableViewController.h"


#pragma mark - 第三方库


#endif /* JRBHeaderFile_h */

