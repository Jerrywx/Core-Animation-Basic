//
//  HomdeData.h
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import <Foundation/Foundation.h>

//image	:	http://app3.qdaily.com/system/articles/banners/22953/mediumApp/22953.jpg?1456504201
//type	:

@interface HomeBanners : NSObject

@property (nonatomic, strong) NSDictionary	*post;
@property (nonatomic, strong) NSString		*image;
@property (nonatomic, strong) NSString		*type;

@end


@interface HomeColumns : NSObject
@property (nonatomic, copy) NSString *id;
//@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *post_count;
@property (nonatomic, copy) NSString *content_provider;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *image_large;
@property (nonatomic, copy) NSString *subscribe_status;
@property (nonatomic, copy) NSString *subscriber_num;
@property (nonatomic, copy) NSString *show_type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, strong) NSDictionary *share;
@end


@interface HomeData : NSObject

@property (nonatomic, strong) NSDictionary	*post;
@property (nonatomic, strong) NSString		*image;
@property (nonatomic, strong) NSString		*type;

@property (nonatomic, assign) CGFloat				cellHeight;
@property (nonatomic, strong) NSAttributedString	*stringTitle;
@property (nonatomic, strong) NSAttributedString	*stringDes;
@property (nonatomic, strong) NSURL					*imgURL;
@property (nonatomic, strong) NSURL					*imgIcon;
@property (nonatomic, strong) NSAttributedString	*nameString;

+ (void)loadHomeModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData, NSString *last_key))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadArticleModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadTopModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadTenModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadCompanyModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadBusinessModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadIntelModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadDesignModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadFashionModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadAmuseModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadCityModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

+ (void)loadGameModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

// =============================================================================
+ (void)loadHomeModelsUrl:(NSString *)urlString
				  Success:(void (^)(NSURLSessionDataTask * _Nonnull task, NSArray *homeData, NSString *last_key))success
				  failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;



- (void)initialization;

@end
