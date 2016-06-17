//
//  Exam.h
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exam : NSObject
/** <#description#> */
@property (nonatomic, copy) NSString* exam_place;

/** <#description#> */
@property (nonatomic, copy) NSString  *exam_startTime;

/** <#description#> */
@property (nonatomic, copy) NSString* exam_date;

/** <#description#> */
@property (nonatomic, copy) NSString* exam_name;

/** <#description#> */
@property (nonatomic, assign) NSInteger  exam_id;

/** <#description#> */
@property (nonatomic, copy) NSString  *exam_endTime;


-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)examWithDict:(NSDictionary *)dict;
@end
