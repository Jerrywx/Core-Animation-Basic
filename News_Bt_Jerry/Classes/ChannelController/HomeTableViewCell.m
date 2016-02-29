//
//  HomeTableViewCell.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeData.h"

#define CELL_H 133
#define CELL_MARGIN 2
#define TEXT_MARGIN 15

@interface HomeTableViewCell ()

@property (nonatomic, strong) CALayer		*picLayer;
@property (nonatomic, strong) CATextLayer	*textLayer;
@property (nonatomic, strong) CALayer		*bottomLayer;
@property (nonatomic, strong) CALayer		*backLayer;

@end

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

		_backLayer = ({
			CALayer *backLayer			= [CALayer layer];
			backLayer.frame				= CGRectMake(0, CELL_MARGIN, SCREEN_W, CELL_H - CELL_MARGIN - CELL_MARGIN);
			backLayer.backgroundColor = [UIColor whiteColor].CGColor;
			backLayer;
		});
		[self.contentView.layer addSublayer:_backLayer];
		
		_picLayer = ({
			CALayer *picLayer		 = [CALayer layer];
			picLayer.frame			 = CGRectMake(SCREEN_W * 0.5, 0, SCREEN_W * 0.5, CELL_H - CELL_MARGIN - CELL_MARGIN);
			picLayer;
		});
		[_backLayer addSublayer:_picLayer];
		
		_textLayer = ({
			CATextLayer *textLayer = [CATextLayer layer];
			textLayer.frame = CGRectMake(TEXT_MARGIN, TEXT_MARGIN, SCREEN_W * 0.5 - TEXT_MARGIN * 2, CELL_H - TEXT_MARGIN * 2 - 30);
			textLayer;
		});
		[_backLayer addSublayer:_textLayer];
		
		_bottomLayer = ({
			CALayer *bottomLayer = [CALayer layer];
			bottomLayer.frame = CGRectMake(TEXT_MARGIN, CGRectGetMaxY(_textLayer.frame) + TEXT_MARGIN, SCREEN_W * 0.5 - TEXT_MARGIN * 2, 20);
			bottomLayer;
		});
		[_backLayer addSublayer:_bottomLayer];
		
	}
	return self;
}

- (void)setHomeData:(HomeData *)homeData {
	_homeData = homeData;
	
	//
	[[SDWebImageManager sharedManager] downloadImageWithURL:homeData.imgURL
													options:SDWebImageRetryFailed
												   progress:nil
												  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
													  
													  self.picLayer.contents = (__bridge id _Nullable)(image.CGImage);  
												  }];
	
	//
	self.textLayer.alignmentMode = kCAAlignmentLeft;
	self.textLayer.string = homeData.stringTitle;
	self.textLayer.truncationMode = kCATruncationEnd;
	self.textLayer.contentsScale = 2.0f;
	self.textLayer.wrapped = YES;
	

}

@end



//[[NSAttributedString alloc] initWithString:(NSString *)title attributes:titleAttrs];
//CATextLayer *titleLayer = [CATextLayer layer];
//titleLayer.frame = textRect;
//titleLayer.alignmentMode = kCAAlignmentCenter;
//titleLayer.string = [self attributedTitleAtIndex:idx];
//titleLayer.truncationMode = kCATruncationEnd;
