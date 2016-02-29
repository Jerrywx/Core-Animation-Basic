//
//  HomeTableViewCell2.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "HomeTableViewCell2.h"
#import "HomeData.h"

#define PIC_H 200
#define CELL_H 340
#define CELL_M 15
#define CELL_MARGIN 2
#define TITLE_H 40
#define DES_H 40
#define BOTTOM_H 20

@interface HomeTableViewCell2 ()
@property (nonatomic, strong) CALayer		*backLayer;
@property (nonatomic, strong) CALayer		*picLayer;
@property (nonatomic, strong) CATextLayer	*titleLayer;
@property (nonatomic, strong) CATextLayer	*desLayer;
@property (nonatomic, strong) CALayer		*bottomLayer;
@end

@implementation HomeTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		_backLayer = ({
			CALayer *backLayer = [CALayer layer];
			backLayer.frame = CGRectMake(0, CELL_MARGIN, SCREEN_W, CELL_H - CELL_MARGIN * 2);
			backLayer.backgroundColor = [UIColor whiteColor].CGColor;
			backLayer;
		});
		[self.contentView.layer addSublayer:_backLayer];
		
		_picLayer = ({
			CALayer *picLayer = [CALayer layer];
			picLayer.frame = CGRectMake(0, 0, SCREEN_W, PIC_H);
			picLayer;
		});
		[_backLayer addSublayer:_picLayer];
		
		_titleLayer = ({
			CATextLayer *titleLayer = [CATextLayer layer];
			titleLayer.frame = CGRectMake(CELL_M, PIC_H + CELL_M, SCREEN_W - CELL_M * 2, TITLE_H);
			titleLayer;
		});
		[_backLayer addSublayer:_titleLayer];
		
		_desLayer = ({
			CATextLayer *desLayer = [CATextLayer layer];
			desLayer.frame = CGRectMake(CELL_M, CGRectGetMaxY(_titleLayer.frame) + CELL_MARGIN, SCREEN_W - CELL_M * 2, DES_H);
			desLayer;
		});
		[_backLayer addSublayer:_desLayer];
		
		_bottomLayer = ({
			CALayer *bottomLayer = [CALayer layer];
			bottomLayer.frame = CGRectMake(CELL_M, CGRectGetMaxY(_desLayer.frame) + CELL_M * 0.5, SCREEN_W - CELL_M * 2, BOTTOM_H);
			bottomLayer;
		});
		[_backLayer addSublayer:_bottomLayer];
		
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
	
}


@end
