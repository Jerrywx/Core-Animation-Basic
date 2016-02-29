//
//  HomdeData.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/27.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "HomeData.h"

@implementation HomeBanners
- (NSString *)description {
	return [NSString stringWithFormat:@"image: %@, type:%@", self.post[@"title"], self.type];
}
@end

@implementation HomeColumns
- (NSString *)description {
	return [NSString stringWithFormat:@"image: %@, type:%@", self.name, self.content_provider];
}
@end


@implementation HomeData

+ (void)loadHomeModelsSuccess:(void (^)(NSURLSessionDataTask * _Nonnull task, NSArray *homeData, NSString *last_key))success
					  failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
	
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/homes/index/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						
						// 1. HomeBanners
//						NSArray *homeBanners = [NSArray yy_modelArrayWithClass:[HomeBanners class] json:responseObject[@"response"][@"banners"]];
						// 2. HomeData
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						// 3. HomeColumns
//						NSArray *homeColumns = [NSArray yy_modelArrayWithClass:[HomeColumns class] json:responseObject[@"response"][@"columns"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						NSString *last_key = responseObject[@"response"][@"last_key"];
						success(task, homeData, last_key);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
	
}



+ (void)loadArticleModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/1/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadTopModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					 failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/16/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadTenModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					 failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/22/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadCompanyModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/63/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadBusinessModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
						  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/18/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadIntelModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					   failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/4/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadDesignModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
						failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/17/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadFashionModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/19/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadAmuseModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					   failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/3/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadCityModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/5/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

+ (void)loadGameModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure {
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/54/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
}

// =============================================================================
+ (void)loadHomeModelsUrl:(NSString *)urlString
				  Success:(void (^)(NSURLSessionDataTask * _Nonnull task, NSArray *homeData, NSString *last_key))success
					  failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
	
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:urlString
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		
						NSArray *homeData = [NSArray yy_modelArrayWithClass:[HomeData class] json:responseObject[@"response"][@"feeds"]];
						[homeData enumerateObjectsUsingBlock:^(HomeData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
							[obj initialization];
						}];
						NSString *last_key = responseObject[@"response"][@"last_key"];
						success(task, homeData, last_key);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
	
}



- (void)initialization {
	
	NSDictionary *titleAttrs = @{
								 NSFontAttributeName : [UIFont systemFontOfSize:16.0f],
								 NSForegroundColorAttributeName : [UIColor blackColor] };
	self.stringTitle = [[NSAttributedString alloc] initWithString:(NSString *)self.post[@"title"] attributes:titleAttrs];
	
	NSDictionary *desAttrs = @{
								 NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
								 NSForegroundColorAttributeName : [UIColor grayColor] };
	
	if (self.type == nil) {
		self.cellHeight = 350;
		self.imgURL = [NSURL URLWithString:self.post[@"image"]];
		self.stringDes = [[NSAttributedString alloc] initWithString:(NSString *)self.post[@"description"] attributes:desAttrs];
		
		self.imgIcon = [NSURL URLWithString:self.post[@"column"][@"icon"]];
		self.nameString = [[NSAttributedString alloc] initWithString:(NSString *)self.post[@"column"][@"name"] attributes:titleAttrs];
		return;
	} else if ([self.type isEqualToString:@"1"]) {
		self.cellHeight = 133;
	} else if ([self.type isEqualToString:@"2"]) {
		self.cellHeight = 340;
		self.stringDes = [[NSAttributedString alloc] initWithString:(NSString *)self.post[@"description"] attributes:desAttrs];
	}
	self.imgURL = [NSURL URLWithString:self.image];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"image: %@, type:%@ --- %f", self.post[@"title"], self.type, self.cellHeight];
}

@end








