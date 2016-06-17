//
//  NoticeContrller.m
//  hedaAssistant
//
//  Created by bear on 16/4/7.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "NoticeController.h"
#import "AddNoticeController.h"
#import "Notice.h"
#import "NoticeCell.h"

@interface NoticeController ()



@property (nonatomic, strong) NSMutableArray *myList;

@end

@implementation NoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(jumpToAddController)];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (section==0) {
//        return 1;
//    }else{
        return  self.myList.count;
//    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NoticeCell *cell=[NoticeCell cellWithTableView:tableView];

//    if (indexPath.section==0) {
//        Notice *notice=[[Notice alloc]init];
//        notice.name=@"课程提醒";
//        notice.time=@"2015-05";
//        cell.notice=notice;
//
//
//
//    }else{
            cell.notice=self.myList[indexPath.row];
//    }

    return cell;
}


/**
 *  做滑动编辑删除
 *
 *  @param tableView
 *  @param indexPath i
 *
 *  @return
 */

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        NSLog(@"点击删除");

        [self.myList removeObjectAtIndex:indexPath.row];
        [self saveData];

        [tableView reloadData];
    }];


    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"提醒" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"提醒");

    }];


    deleteRoWAction.backgroundColor=[UIColor colorWithRed:251/255.0 green:0 blue:85/255.0 alpha:1];
    editRowAction.backgroundColor = [UIColor lightGrayColor];//可以定义RowAction的颜色

    return @[deleteRoWAction, editRowAction];//最后返回这俩个RowAction 的数组
}




#pragma mark 跳转到添加控制器
-(void)jumpToAddController{

    AddNoticeController *addNotcieVc=[[AddNoticeController alloc]init];
    addNotcieVc.addNoticeBlock=^(Notice *notice){

        [self.myList addObject:notice];
        [self saveData];
        [self.tableView reloadData ];
    };

    [self.navigationController pushViewController:addNotcieVc animated:YES];
}






-(NSMutableArray *)myList{

    if (!_myList) {

        _myList=[self readData];

        if (!_myList) {
            _myList=[NSMutableArray array];
        }
    }
    return _myList;
}




#pragma mark 存取数据
-(NSMutableArray *)readData{
    return  [NSKeyedUnarchiver unarchiveObjectWithFile:[self getFilePath]];
}
-(void)saveData{
    [NSKeyedArchiver archiveRootObject:self.myList toFile:[self getFilePath]];

}


#pragma mark 获取归档路径
-(NSString *)getFilePath{
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  lastObject];
    return [path stringByAppendingPathComponent:@"Notice.data"];

}


@end
