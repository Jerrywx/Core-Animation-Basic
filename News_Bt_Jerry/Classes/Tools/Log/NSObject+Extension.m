//
//  NSObject+Extension.m
//  T11-runtime
//
//  Created by Jerry on 15/5/30.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

const char *propertiesKey = "propertiesKey";
const char *methodsKey = "methodsKey";
const char *protocolKey = "protocolKey";

/// 字典转模型方法
+ (instancetype)objectWithDict:(NSDictionary *)dict
{
	id obj = [[self alloc] init];

	// 获取属性列表
	NSArray *properties = [self propertyList];
	
	// 遍历属性数组
	for (NSString *key in properties) {
		// 判断字典中是否包含这个key
		if (dict[key] != nil) {

			// 使用 KVC 设置属性值
			[obj setValue:dict[key] forKeyPath:key];
		}
	}
	
	return obj;
}

/**
 如果能够自动生成这个数组，就好了！
 如果要想动态的获取类的属性，需要使用到“运行时机制”
 
 class_copyIvarList 成员变量，提示有很多第三方框架会使用 Ivar，能够获得更多的信息
 但是：在 swift 中，由于语法结构的变化，使用 Ivar 非常不稳定，经常会崩溃！
 class_copyPropertyList 属性
 class_copyMethodList 方法
 class_copyProtocolList 协议
 */
/// 返回类的属性列表
+ (NSArray *)propertyList {
	
	// 0. 判断是否存在关联对象, 如果存在, 直接返回
	/** 参数
	 1> 关联到得对象
	 2> 关联的属性 key
	 */
	NSArray *plist = objc_getAssociatedObject(self, propertiesKey);
	if (plist) {
		return plist;
	}
	
	// 1. 获取 '类的属性'
	/**
	 1> 类
	 2> 属性的计数指针
	 */
	unsigned int count = 0;
	// 返回值是所有属性的数组 obj_property_
	objc_property_t *list = class_copyPropertyList([self class], &count);
	
	// 创建 存储属性数组
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
	
	for (int i = 0; i < count; ++i) {
		
		// 获取属性
		objc_property_t pty = list[i];
		
		// 获取属性名
		const char *cname = property_getName(pty);
		[arrayM addObject:[NSString stringWithUTF8String:cname]];
	}
	
	// 释放属性数组
	free(list);
	
	// 设置关联对象
	/**
	 1> 关联的对象
	 2> 关联对象的 key
	 3> 属性数值
	 4> 属性的持有方式 reatin, copy, assign
	 */
	objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
	
	return arrayM.copy;
}

/// 返回类的方法列表
+ (NSArray *)methodList {
	
	// 0. 判断是否存在依赖关系
	NSArray *mlist = objc_getAssociatedObject(self, methodsKey);
	if (mlist) {
		return mlist;
	}
	
	unsigned int count = 0;
	// 1. 获取方法列表
	Method *list = class_copyMethodList([self class], &count);

	// 存储方法数组
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
	
	for (int i = 0; i < count; ++i) {
		// 获取方法
		Method method = list[i];
		// 获取方法名
		SEL mname = method_getName(method);

		[arrayM addObject: NSStringFromSelector(mname)];
	}

	// 释放数组
	free(list);
	
	// 设置依赖关系
	objc_setAssociatedObject(self, methodsKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
	
	return arrayM.copy;
}

/// 返回类的实现协议列表
+ (NSArray *)protocolList {

	// 0. 判断是否存在依赖关系
	NSArray *pList = objc_getAssociatedObject(self, protocolKey);
	if (pList) {
		return pList;
	}
	
	unsigned int count = 0;
	// 2. 获取协议列表
	Protocol * __unsafe_unretained *list = class_copyProtocolList([self class], &count);
	
	// 创建协议数组
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
	
	for (int i = 0; i < count; ++i) {
		
		// 获取协议
		Protocol * __unsafe_unretained prot = list[i];
		
		const char *pname = protocol_getName(prot);
		
		[arrayM addObject:[NSString stringWithUTF8String:pname]];
	}
	
	return arrayM;
}

@end




