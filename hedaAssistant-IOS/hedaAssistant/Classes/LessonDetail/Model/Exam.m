//
//  Exam.m
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Exam.h"

@implementation Exam


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


//        self.exam_date=dict[@"exam_date"];
//
//        self.exam_endTime=dict[@"exam_endTime"];
//
//        self.exam_startTime=dict[@"exam_startTime"];
//
//        self.exam_name=dict
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
+(instancetype)examWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}



@end
