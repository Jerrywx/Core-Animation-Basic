//
//  ArticleViewController.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ArticleViewController.h"
#import "HomeData.h"
#import "HomeTableViewCell.h"
#import "HomeTableViewCell2.h"
#import "HomeTableViewCell3.h"
#import "NewsContentController.h"

@interface ArticleViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView	*tableView;
@property (nonatomic, strong) NSArray		*articleData;
@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	[self setUpView];
	[self loadData];
}

- (void)setUpView {
	self.view.backgroundColor = [UIColor whiteColor];
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.tableView = ({
		CGRect frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - NAVBAR_H);
		UITableView *tabelView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
		tabelView.delegate = self;
		tabelView.dataSource = self;
		tabelView;
	});
	[self.view addSubview:self.tableView];
}

- (void)loadData {
	[HomeData loadArticleModelsSuccess:^(NSURLSessionDataTask * _Nonnull task, NSArray *articleData) {
		self.articleData = articleData;
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
	}];
}

- (void)setArticleData:(NSArray *)articleData {
	_articleData = articleData;
	[self.tableView reloadData];
}

#pragma mark - UITableDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (self.articleData.count > 0) {
		return self.articleData.count;
	}
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.articleData.count > 0) {
		HomeData *homeData = self.articleData[indexPath.row];
		if ([homeData.type isEqualToString:@"1"]) {
			HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homdeCell"];
			if (!cell) {
				cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homdeCell"];
			}
			cell.homeData = homeData;
			cell.backgroundColor = [UIColor clearColor];
			return cell;
		} else if ([homeData.type isEqualToString:@"2"]) {
			HomeTableViewCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"homeCell2"];
			if (!cell2) {
				cell2 = [[HomeTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homdeCell2"];
			}
			cell2.homeData = homeData;
			cell2.backgroundColor = [UIColor clearColor];
			return cell2;
		} else {
			HomeTableViewCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"homeCell3"];
			if (!cell3) {
				cell3 = [[HomeTableViewCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homdeCell3"];
			}
			cell3.homeData = homeData;
			cell3.backgroundColor = [UIColor clearColor];
			return cell3;
		}
		
	} else {
		HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homdeCell"];
		if (!cell) {
			cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homdeCell"];
		}
		cell.backgroundColor = [UIColor clearColor];
		return cell;
	}
}

#pragma mark - UItableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	HomeData *homeModel = self.articleData[indexPath.row];
	NewsContentController *newsVC = [[NewsContentController alloc] init];
	[self.navigationController pushViewController:newsVC animated:YES];
	newsVC.urlString = homeModel.post[@"appview"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	if (self.articleData.count > 0) {
		HomeData *homeData = self.articleData[indexPath.row];
		return homeData.cellHeight;
	}
	return 133;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.1;
}


@end
