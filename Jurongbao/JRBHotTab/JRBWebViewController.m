//
//  JRBWebViewController.m
//  Jurongbao
//
//  Created by wangrongchao on 15/10/21.
//  Copyright © 2015年 truly. All rights reserved.
//

#import "JRBWebViewController.h"
#import "JRBWebProgressView.h"
@interface JRBWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic)JRBWebProgressView * webProgressView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JRBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createProgessBar];

    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self backForwardAction];
}


-(void)createProgessBar{
    JRBWebProgressView *pv = [[JRBWebProgressView alloc]initWithFrame:CGRectMake(0, 44-3, self.view.frame.size.width, 3)
                                                       progressHeight:3];
    [self.navigationController.navigationBar addSubview:pv];
    self.webProgressView = pv;
}

- (void)backForwardAction{
    [self.webProgressView removeFromSuperview];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [self.webProgressView shouldStartLoadWithRequestProgressAnimation];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.webProgressView webViewDidStartLoadProgressAnimation];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webProgressView webViewDidFinishLoadProgressAnimation];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.webProgressView webViewDidFinishLoadProgressAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
