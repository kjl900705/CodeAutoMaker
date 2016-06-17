//
//  Notice.m
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Notice.h"

@implementation Notice
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
+(instancetype)noticeWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self.name=[aDecoder decodeObjectForKey:@"name"];
    self.time=[aDecoder decodeObjectForKey:@"time"];
    self.isOn=[aDecoder decodeBoolForKey:@"isOn"];
    return self;
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeBool:self.isOn forKey:@"isOn"];
}

@end
