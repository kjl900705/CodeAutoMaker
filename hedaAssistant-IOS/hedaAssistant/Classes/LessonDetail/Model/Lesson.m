//
//  Lesson.m
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson


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
+(instancetype)lessonWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


@end
