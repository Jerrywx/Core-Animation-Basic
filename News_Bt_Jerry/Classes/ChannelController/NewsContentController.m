//
//  NewsContentController.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "NewsContentController.h"

@interface NewsContentController ()
@property (nonatomic, strong) UIWebView			*webView;
@end

@implementation NewsContentController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setUpView];
}

- (void)setUpView {
	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	self.webView = ({
		UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, NAVBAR_H, SCREEN_W, SCREEN_H - NAVBAR_H)];
		webView.scrollView.bounces = NO;
		webView;
	});
	[self.view addSubview:self.webView];

	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
																			 style:UIBarButtonItemStylePlain
																			target:self
																			action:@selector(back)];
	
	if (self.urlString.length > 0) {
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
		[self.webView loadRequest:request];
	}
}

- (void)back {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//开启ios右滑返回
	if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
		self.navigationController.interactivePopGestureRecognizer.delegate = nil;
	}
}

@end
