//
//  ViewController.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/26.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) HMSegmentedControl			*segment;
@property (nonatomic, strong) UIScrollView					*scrollView;
@property (nonatomic, strong) NSArray						*channels;
@property (nonatomic, strong) NSDictionary					*textAttributes;
@property (nonatomic, strong) NSDictionary					*selectedAttributes;
@property (nonatomic, assign) BOOL							scrollViewAnimationing;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self setUpView];
}

- (void)setUpView {

	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	self.segment = ({
		HMSegmentedControl *segment = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 300, 24)];
		segment.sectionTitles		= self.channels;
		segment.backgroundColor		= [UIColor clearColor];
		segment.titleTextAttributes = self.textAttributes;
		segment.segmentWidthStyle	= HMSegmentedControlSegmentWidthStyleDynamic;
		segment.segmentEdgeInset	= UIEdgeInsetsMake(0, 10, 0, 10);
		segment.selectionIndicatorHeight	= 2;
		segment.selectionIndicatorColor		= [UIColor blackColor];
		segment.selectedTitleTextAttributes = self.selectedAttributes;
		segment.selectionIndicatorLocation	= HMSegmentedControlSelectionIndicatorLocationDown;
		[segment addTarget:self action:@selector(changeChannel) forControlEvents:UIControlEventValueChanged];
		segment;
	});
	self.navigationItem.titleView = self.segment;

	self.scrollView = ({
		UIScrollView *scrollView	= [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVBAR_H, SCREEN_W, SCREEN_H - NAVBAR_H)];
		scrollView.contentSize		= CGSizeMake(SCREEN_W * self.channels.count, SCREEN_H - NAVBAR_H);
		scrollView.pagingEnabled	= YES;
		scrollView.scrollsToTop		= NO;
		scrollView.delegate			= self;
		scrollView;
	});
	[self.view addSubview:self.scrollView];
	
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Info"
																			 style:UIBarButtonItemStylePlain
																			target:self
																			action:@selector(info)];

	[self creatChannel];
}

- (void)creatChannel {
	
	HomeViewController		*homeVC = [[HomeViewController alloc] init];
	ArticleViewController	*artVC  = [[ArticleViewController alloc] init];
	TopViewController		*topVC  = [[TopViewController alloc] init];
	TenPicViewController	*tenVC  = [[TenPicViewController alloc] init];
	CompanyViewController	*comVC  = [[CompanyViewController alloc] init];
	BusinessViewController	*busiVC = [[BusinessViewController alloc] init];
	IntelligentViewController *inteVC = [[IntelligentViewController alloc] init];
	DesignViewController	*designVC = [[DesignViewController alloc] init];
	FashionViewController	*fanshVC  = [[FashionViewController alloc] init];
	AmuseViewController		*amuseVC  = [[AmuseViewController alloc] init];
	CityViewController		*cityVC	  = [[CityViewController alloc] init];
	GameViewController		*gameVC	  = [[GameViewController alloc] init];
	
	[self addChildViewController:homeVC];
	[self addChildViewController:artVC];
	[self addChildViewController:topVC];
	[self addChildViewController:tenVC];
	[self addChildViewController:comVC];
	
	[self addChildViewController:busiVC];
	[self addChildViewController:inteVC];
	[self addChildViewController:designVC];
	[self addChildViewController:fanshVC];
	[self addChildViewController:amuseVC];
	[self addChildViewController:cityVC];
	[self addChildViewController:gameVC];
	
	homeVC.view.frame	= CGRectMake(SCREEN_W * 0, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	artVC.view.frame	= CGRectMake(SCREEN_W * 1, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	topVC.view.frame	= CGRectMake(SCREEN_W * 2, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	tenVC.view.frame	= CGRectMake(SCREEN_W * 3, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	comVC.view.frame	= CGRectMake(SCREEN_W * 4, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	busiVC.view.frame	= CGRectMake(SCREEN_W * 5, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	inteVC.view.frame	= CGRectMake(SCREEN_W * 6, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	designVC.view.frame = CGRectMake(SCREEN_W * 7, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	fanshVC.view.frame  = CGRectMake(SCREEN_W * 8, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	amuseVC.view.frame  = CGRectMake(SCREEN_W * 9, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	cityVC.view.frame	= CGRectMake(SCREEN_W * 10, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	gameVC.view.frame	= CGRectMake(SCREEN_W * 11, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
	
	
	[self.scrollView addSubview:homeVC.view];
	[self.scrollView addSubview:artVC.view];
	[self.scrollView addSubview:topVC.view];
	[self.scrollView addSubview:tenVC.view];
	[self.scrollView addSubview:comVC.view];
	[self.scrollView addSubview:busiVC.view];
	[self.scrollView addSubview:inteVC.view];
	[self.scrollView addSubview:designVC.view];
	[self.scrollView addSubview:fanshVC.view];
	[self.scrollView addSubview:amuseVC.view];
	[self.scrollView addSubview:cityVC.view];
	[self.scrollView addSubview:gameVC.view];
	
	
	artVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											  saturation:( arc4random() % 256 / 256.0 )
											  brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	
	topVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	tenVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	comVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	
	busiVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	inteVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	designVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	fanshVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	amuseVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	cityVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
	gameVC.view.backgroundColor = 	[UIColor colorWithHue:( arc4random() % 256 / 256.0 )
											 saturation:( arc4random() % 256 / 256.0 )
											 brightness:( arc4random() % 256 / 256.0 ) alpha:1];
}

- (void)changeChannel {
	self.scrollViewAnimationing = YES;
	NSInteger index = self.segment.selectedSegmentIndex;
	[self.scrollView setContentOffset:CGPointMake(index * SCREEN_W, 0) animated:YES];
}

- (void)info {
	NSLog(@"Info");
}

#pragma mark - UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (self.scrollViewAnimationing) return;
	CGFloat scrollViewX = scrollView.contentOffset.x + SCREEN_W * 0.5;
	[self.segment setSelectedSegmentIndex:(long)(scrollViewX / SCREEN_W) animated:YES];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	self.scrollViewAnimationing = NO;
}

#pragma mark - 懒加载
- (NSArray *)channels {
	if (_channels) {
		return _channels;
	}
	
	_channels = @[@"首页", @"长文章", @"Top15", @"10个图",
				  @"公司头条", @"商业", @"智能", @"设计",
				  @"时尚", @"娱乐", @"城市", @"游戏"];
	
	return _channels;
}

- (NSDictionary *)textAttributes {
	if (_textAttributes) {
		return _textAttributes;
	}
	
	_textAttributes = @{
						NSFontAttributeName : [UIFont systemFontOfSize:12.0f],
						NSForegroundColorAttributeName : [UIColor blackColor],
						};
	
	return _textAttributes;
}

- (NSDictionary *)selectedAttributes {
	
	if (_selectedAttributes) {
		return _selectedAttributes;
	}
	
	_selectedAttributes = @{
							NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
							NSForegroundColorAttributeName : [UIColor blackColor],
							};
	
	return _selectedAttributes;
}

@end

