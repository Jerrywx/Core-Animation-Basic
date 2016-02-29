//
//  HomeTableViewCell3.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/28.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "HomeTableViewCell3.h"
#import "HomeData.h"

#define HEAD_H 23
#define PIC_H 200
#define CELL_H 350
#define CELL_M 15
#define CELL_MARGIN 2
#define TITLE_H 30
#define DES_H 40
#define BOTTOM_H 20

@interface HomeTableViewCell3 ()

@property (nonatomic, strong) CALayer		*backLayer;
@property (nonatomic, strong) CALayer		*headerIcon;
@property (nonatomic, strong) CATextLayer	*headerTitle;
@property (nonatomic, strong) CALayer		*headerShare;
@property (nonatomic, strong) CALayer		*picLayer;
@property (nonatomic, strong) CATextLayer	*titleLayer;
@property (nonatomic, strong) CATextLayer	*desLayer;

@end


@implementation HomeTableViewCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		_backLayer = ({
			CALayer *backLater = [CALayer layer];
			backLater.frame = CGRectMake(0, CELL_MARGIN, SCREEN_W, CELL_H - CELL_MARGIN * 2);
			backLater.backgroundColor = [UIColor whiteColor].CGColor;
			backLater;
		});
		[self.contentView.layer addSublayer:_backLayer];

		_headerIcon = ({
			CALayer *headerLayer = [CALayer layer];
			headerLayer.frame = CGRectMake(CELL_M * 2, CELL_M, HEAD_H, HEAD_H);
			headerLayer;
		});
		[_backLayer addSublayer:_headerIcon];
		
		_headerTitle = ({
			CATextLayer *headerTitle = [CATextLayer layer];
			CGFloat width = SCREEN_W - CELL_M * 5 - HEAD_H * 2;
			headerTitle.frame = CGRectMake(CGRectGetMaxX(_headerIcon.frame) + CELL_M, CELL_M, width, HEAD_H);
			headerTitle;
		});
		[_backLayer addSublayer:_headerTitle];
		
		_headerShare = ({
			CALayer *headerShare = [CALayer layer];
			CGFloat x = SCREEN_W - CELL_M - HEAD_H;
			headerShare.frame = CGRectMake(x, CELL_M, HEAD_H, HEAD_H);
			headerShare;
		});
		[_backLayer addSublayer:_headerShare];
		
		_picLayer = ({
			CALayer *picLayer = [CALayer layer];
			picLayer.frame = CGRectMake(0, CELL_M * 2 + HEAD_H, SCREEN_W, PIC_H);
			picLayer;
		});
		[_backLayer addSublayer:_picLayer];
		
		_titleLayer = ({
			CATextLayer *titleLayer = [CATextLayer layer];
			titleLayer.frame = CGRectMake(CELL_M, CGRectGetMaxY(_picLayer.frame) + CELL_M, SCREEN_W - CELL_M * 2, TITLE_H);
			titleLayer;
		});
		[_backLayer addSublayer:_titleLayer];
		
		_desLayer = ({
			CATextLayer *desLayer = [CATextLayer layer];
			desLayer.frame = CGRectMake(CELL_M, CGRectGetMaxY(_titleLayer.frame) + CELL_MARGIN, SCREEN_W - CELL_M * 2, DES_H);
			desLayer;
		});
		[_backLayer addSublayer:_desLayer];
		
	}
	return self;
}

- (void)setHomeData:(HomeData *)homeData {
	_homeData = homeData;
	
	[[SDWebImageManager sharedManager] downloadImageWithURL:homeData.imgURL
													options:SDWebImageRetryFailed
												   progress:nil
												  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
													  
													  self.picLayer.contents = (__bridge id _Nullable)(image.CGImage);
												  }];
	
	[[SDWebImageManager sharedManager] downloadImageWithURL:homeData.imgIcon
													options:SDWebImageRetryFailed
												   progress:nil
												  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
													  
													  self.headerIcon.contents = (__bridge id _Nullable)(image.CGImage);
												  }];
	
	self.headerShare.contents = (__bridge id _Nullable)([UIImage imageNamed:@"feedShare"].CGImage);
	self.headerShare.contentsGravity = kCAGravityResizeAspect;
	
	self.titleLayer.alignmentMode = kCAAlignmentLeft;
	self.titleLayer.string = homeData.stringTitle;
	self.titleLayer.truncationMode = kCATruncationEnd;
	self.titleLayer.contentsScale = 2.0f;
	self.titleLayer.wrapped = YES;
	
	self.desLayer.alignmentMode = kCAAlignmentLeft;
	self.desLayer.string = homeData.stringDes;
	self.desLayer.truncationMode = kCATruncationEnd;
	self.desLayer.contentsScale = 2.0f;
	self.desLayer.wrapped = YES;
	
	self.headerTitle.alignmentMode = kCAAlignmentLeft;
	self.headerTitle.string = homeData.nameString;
	self.headerTitle.truncationMode = kCATruncationEnd;
	self.headerTitle.contentsScale = 2.0f;
	self.headerTitle.wrapped = YES;
	
}

@end
















