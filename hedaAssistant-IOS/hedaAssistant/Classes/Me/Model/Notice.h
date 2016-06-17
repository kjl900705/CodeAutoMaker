//
//  Notice.h
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notice : NSObject<NSCoding>


@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *time;

@property (nonatomic,assign)BOOL isOn;



-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)noticeWithDict:(NSDictionary *)dict;

@end
