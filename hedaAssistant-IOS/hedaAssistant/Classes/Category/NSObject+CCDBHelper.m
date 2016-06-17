//
//  NSObject+CCDBHelper.m
//  hedaAssistant
//
//  Created by bear on 16/5/6.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "NSObject+CCDBHelper.h"
#import <objc/runtime.h>
#import "News.h"



static NSString * const kDataBase = @"DataBase";

@interface NSObject ()


@property (nonatomic, strong) FMDatabase *db;

@end


@implementation NSObject (CCDBHelper)



-(void)setDb:(FMDatabase *)db{

    objc_setAssociatedObject(self, &kDataBase, db, OBJC_ASSOCIATION_ASSIGN);
}

-(FMDatabase *)db{


   return objc_getAssociatedObject(self, &kDataBase);

}


-(BOOL)cc_createTabe{

    BOOL isSuccess;

    //1.获得数据库文件的路径
    NSString *doc =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];

    NSString *DBName=[[NSBundle mainBundle] bundleIdentifier] ;

    DBName =[DBName stringByAppendingString:@".sqlite"];


    NSString *fileName = [doc stringByAppendingPathComponent:DBName];

    //2.获得数据库
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];

    self.db=db;

    //3.使用如下语句，如果打开失败，可能是权限不足或者资源不足。通常打开完操作操作后，需要调用 close 方法来关闭数据库。在和数据库交互 之前，数据库必须是打开的。如果资源或权限不足无法打开或创建数据库，都会导致打开失败。
    if ([self.db open])
    {
        [[self class] propertList];

        NSMutableString *tableConstruct=[NSMutableString stringWithString:@"CREATE TABLE IF NOT EXISTS "];
        [tableConstruct appendString:NSStringFromClass([self class])];
        [tableConstruct appendString:@" (id INTEGER PRIMARY KEY AUTOINCREMENT,"];

        NSArray *propertyNameList=[self propertNameList];
        NSArray * attributesList=[self propertAttributesList];

        for (NSInteger i = 0; i < propertyNameList.count; i++) {

            [tableConstruct appendString:propertyNameList[i]];
            [tableConstruct appendString:@" "];

            [tableConstruct appendString:[self getfliedTypeByattributes:attributesList[i]]];

            [tableConstruct appendString:@" "];
            [tableConstruct appendString:@"NOT NULL"];

            if (i!=propertyNameList.count-1) {
                 [tableConstruct appendString:@","];
            }

        }

        [tableConstruct appendString:@");"];

        NSLog(@"------>%@",tableConstruct);

        //4.创表
        BOOL result = [self.db executeUpdate:tableConstruct];

        if (result)
        {
            isSuccess=YES;
            NSLog(@"创建表成功");
        }
    }

    return isSuccess;
}




//传入需要保存的model类型
-(BOOL)cc_insert:(NSObject *)model{

    NSArray *propertyNameList=[self propertNameList];

    NSMutableString *sql=[NSMutableString stringWithString:@"insert into "];
    [sql appendString:NSStringFromClass([self class])];

//    @"insert into users values(?,?,?)";
        NSLog(@"%@",sql);
    [sql appendString:@"( 0,"];
        NSLog(@"%@",sql);

    for (NSInteger i = 0; i < propertyNameList.count; i++) {

        NSLog(@"propertyNameList:%@",propertyNameList[0]);



        //objc_property_t property = propertyNameList[i];


        NSString *propertyName=[NSString stringWithFormat:@"_%@",propertyNameList[i]];

        NSLog(@"%@",model);

//         News *news = model;


//        NSLog(@"%@ %@",news.news_id,news.news_time);

        NSLog(@"%@",propertyName);



        NSLog(@"%@IIIIIIII",[News valueForKeyPath:propertyName]);

        [sql appendString:[model valueForKeyPath:propertyName]];


        if (i!=propertyNameList.count-1) {
            [sql appendString:@","];
        }
            NSLog(@"%@",sql);
    }
     [sql appendString:@");"];



    NSLog(@"%@",sql);
    NSLog(@"test-------------");

      [self.db executeQuery:sql];

    return YES;
}


//传入设置了  需要删除的模型  的属性值
-(BOOL)cc_delete:(NSObject *)model{

  return YES;
}


//传入修改后的模型
-(BOOL)cc_update:(NSObject *)model{

        return YES;
}


//使用方法 .传入设置了  需要查询的模型 的属性值  ,其它可为空
-(NSObject *)cc_featchOne:(NSObject *)model{

    return nil;
}

//使用方法 .传入设置了  需要查询的模型 的属性值  ,其它可为空
-(NSArray *)cc_featchAll:(NSObject *)model{

    return nil;
}



+ (NSArray *)propertList
{
    unsigned int count = 0;
    //获取模型属性, 返回值是所有属性的数组 objc_property_t
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    //便利数组
    for (int i = 0; i< count; i++) {
        //获取属性
        objc_property_t property = propertyList[i];
        //获取属性名称
        const char *cName = property_getName(property);

        NSLog(@">>>>>%s",property_getAttributes(property));

        NSString *attributes = [[NSString alloc]initWithUTF8String:property_getAttributes(property)];
        [attributes containsString:@"NSString"];


        NSString *name = [[NSString alloc]initWithUTF8String:cName];
        //添加到数组中
        [arr addObject:name];
    }
    //释放属性组
    free(propertyList);
    return arr.copy;
}


- (NSArray *)propertNameList
{
    unsigned int count = 0;
    //获取模型属性, 返回值是所有属性的数组 objc_property_t
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    //便利数组
    for (int i = 0; i< count; i++) {
        //获取属性
        objc_property_t property = propertyList[i];
        //获取属性名称
        const char *cName = property_getName(property);

        NSLog(@">>>>>%s",property_getAttributes(property));

        NSString *attributes = [[NSString alloc]initWithUTF8String:property_getAttributes(property)];
        [attributes containsString:@"NSString"];


        NSString *name = [[NSString alloc]initWithUTF8String:cName];
        //添加到数组中
        [arr addObject:name];
    }
    //释放属性组
    free(propertyList);
    return arr.copy;
}


- (NSArray *)propertAttributesList
{
    unsigned int count = 0;
    //获取模型属性, 返回值是所有属性的数组 objc_property_t
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    //便利数组
    for (int i = 0; i< count; i++) {
        //获取属性
        objc_property_t property = propertyList[i];

        NSLog(@">>>>>%s",property_getAttributes(property));

        NSString *attributes = [[NSString alloc]initWithUTF8String:property_getAttributes(property)];

        //添加到数组中
        [arr addObject:attributes];
    }
    //释放属性组
    free(propertyList);
    return arr.copy;
}



+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    id obj = [self new];
    // 遍历属性数组
    for (NSString *property in [self propertList]) {
        // 判断字典中是否包含这个key
        if (dict[property]) {
            // 使用 KVC 赋值
            [obj setValue:dict[property] forKey:property];
        }
    }
    return obj;
}



//- (NSMutableArray *)propertyVaules{
//
//    NSMutableArray * propertyNames = (NSMutableArray *)[self propertNameList];
//
//    NSMutableArray * propertyVaules = [NSMutableArray arrayWithCapacity:propertyNames.count];
//
//    for (int i = 0; i<propertyNames.count; i++) {
//
//        id propertyValue = [self valueForKey:[propertyNames objectAtIndex:i]];
//
//        if (nil != propertyValue) {
//            
//        }
//        
//    }
//}

-(NSString *)getfliedTypeByattributes:(NSString *)attributes{

    NSString *fliedType;

    if ([attributes containsString:@"NSString"]) {


        fliedType=@"text";

    }else if ([attributes containsString:@"NSNumber"]) {

        fliedType=@"integer";

    }

    return fliedType;

}


@end
