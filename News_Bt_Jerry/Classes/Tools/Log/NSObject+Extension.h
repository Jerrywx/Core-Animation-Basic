//
//  NSObject+Extension.h
//  T11-runtime
//
//  Created by Jerry on 15/5/30.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *	字典转模型方法
 */
+ (instancetype)objectWithDict:(NSDictionary *)dict;

/**
 *	返回类的属性列表
 */
+ (NSArray *)propertyList;

/**
 *	返回类的方法列表
 */
+ (NSArray *)methodList;

/**
 *	返回类的实现协议列表
 */
+ (NSArray *)protocolList;

@end
