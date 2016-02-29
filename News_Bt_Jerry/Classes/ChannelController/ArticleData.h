//
//  ArticleData.h
//  News_Bt_Jerry
//
//  Created by 王潇 on 16/2/28.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleData : NSObject

+ (void)loadHomeModelsSuccess:(void (^)(NSURLSessionDataTask * task,NSArray *homeData))success
					  failure:(void (^)(NSURLSessionDataTask * task, NSError *error))failure;

@end
