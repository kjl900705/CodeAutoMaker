//
//  User.h
//  hedaAssistant
//
//  Created by bear on 16/4/8.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>
/** 邮箱 */
@property (nonatomic, copy) NSString* user_email;

/** 电话 */
@property (nonatomic, assign) NSInteger  user_phone;

/** 用户id */
@property (nonatomic, assign) NSInteger  user_id;

/** 用户密码 */
@property (nonatomic, copy) NSString* user_pwd;

/** 用户姓名 */
@property (nonatomic, copy) NSString* user_name;



-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)userWithDict:(NSDictionary *)dict;
@end
