//
//  NSObject+CCDBHelper.h
//  hedaAssistant
//
//  Created by bear on 16/5/6.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>

@interface NSObject (CCDBHelper)


-(BOOL)cc_createTabe;
//传入需要保存的model类型
-(BOOL)cc_insert:(NSObject *)model;


//传入设置了  需要删除的模型  的属性值
-(BOOL)cc_delete:(NSObject *)model;


//传入修改后的模型
-(BOOL)cc_update:(NSObject *)model;


//使用方法 .传入设置了  需要查询的模型 的属性值  ,其它可为空
-(NSObject *)cc_featchOne:(NSObject *)model;

//使用方法 .传入设置了  需要查询的模型 的属性值  ,其它可为空
-(NSArray *)cc_featchAll:(NSObject *)model;


@end
