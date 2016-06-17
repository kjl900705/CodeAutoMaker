//
//  News.m
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "News.h"
#import "NSObject+CCDBHelper.h"

@implementation News
/**
 *  初始化方法
 *
 *  @param dict 字典
 *
 *  @return 对象
 */

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self cc_createTabe];
        //使用KVC
        [self setValuesForKeysWithDictionary:dict];


    }
    return self;
}




/**
 *  工厂方法
 *
 *  @param dict 数据字典
 *
 *  @return 对象
 */
+(instancetype)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end



