//
//  News.h
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy) NSString *news_time;

@property (nonatomic, copy) NSString *news_id;

@property (nonatomic, copy) NSString *news_title;

@property (nonatomic, copy) NSString *news_content;

@property (nonatomic, copy) NSString *news_pic;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)newsWithDict:(NSDictionary *)dict;
@end
