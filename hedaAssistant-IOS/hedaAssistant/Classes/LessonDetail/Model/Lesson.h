//
//  Lesson.h
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lesson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic,strong)NSNumber *start;
@property (nonatomic,strong)NSNumber* end;
@property (nonatomic, strong) NSNumber* day;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)lessonWithDict:(NSDictionary *)dict;

@end
