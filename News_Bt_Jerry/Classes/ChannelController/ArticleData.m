//
//  ArticleData.m
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/28.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ArticleData.h"

@implementation ArticleData

+ (void)loadHomeModelsSuccess:(void (^)(NSURLSessionDataTask * _Nonnull task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
	
	AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
	
	NSURLSessionDataTask *dataTask = nil;
	dataTask = [session GET:@"http://app3.qdaily.com/app3/categories/index/1/0.json"
				 parameters:nil
				   progress:nil
					success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
						
						NSLog(@"成功: %@", responseObject);
//						success(task, homeData);
					} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
						NSLog(@"失败");
					}];
	
}

@end
