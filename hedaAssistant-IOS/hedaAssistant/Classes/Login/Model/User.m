//
//  User.m
//  hedaAssistant
//
//  Created by bear on 16/4/8.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithCoder:(NSCoder *)aDecoder{


    self.user_email=[aDecoder decodeObjectForKey:@"user_email"];
    self.user_id=[aDecoder  decodeIntegerForKey:@"user_id"];
    self.user_name=[aDecoder decodeObjectForKey:@"user_name"];
    self.user_phone=[aDecoder decodeIntegerForKey:@"user_phone"];
    self.user_pwd=[aDecoder decodeObjectForKey:@"user_pwd"];




    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.user_email forKey:@"user_email"];
    [aCoder encodeInteger:self.user_id forKey:@"user_id"];
    [aCoder encodeObject:self.user_name forKey:@"user_name"];
    [aCoder encodeInteger:self.user_phone forKey:@"user_phone"];
    [aCoder encodeObject:self.user_pwd forKey:@"user_pwd"];
}

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
+(instancetype)userWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}




@end

