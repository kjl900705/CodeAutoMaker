//
//  BasePlistController.m
//  hedaAssistant
//
//  Created by bear on 16/4/7.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BasePlistController.h"
#import "BasePlistCell.h"

@interface BasePlistController ()



@end

@implementation BasePlistController

- (void)viewDidLoad {
    [super viewDidLoad];





}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr[section][Items] count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return  self.dataArr[section][SectionHeader];
}



-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.dataArr[section][SectionFooter];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    BasePlistCell
    NSDictionary *item=self.dataArr[indexPath.section][Items][indexPath.row];
    BasePlistCell *cell=[BasePlistCell cellWithTableView:tableView item:item];


    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *item=self.dataArr[indexPath.section][Items][indexPath.row];


    UITableViewCell *selectedCell=[tableView cellForRowAtIndexPath:indexPath];

    selectedCell.selected=NO;


    NSString *classStr=item[TargetVc];
    if (classStr.length<=0) {
        return;
    }


    Class className=NSClassFromString(classStr);

    UIViewController *vc=[[className alloc]initWithStyle:UITableViewStyleGrouped];


    if ([vc isKindOfClass:[BasePlistController class]]) {

        BasePlistController *bpVc=(BasePlistController *)vc;
        bpVc.plsitName=item[PlistName];

        bpVc.title=item[Title];
        [self.navigationController pushViewController:bpVc animated:YES];

    }else{
        [self.navigationController pushViewController:vc animated:YES];
    }


}


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        NSString *path=[[NSBundle mainBundle] pathForResource:self.plsitName ofType:@"plist"];
        _dataArr=[NSMutableArray arrayWithContentsOfFile:path];
    }

    return _dataArr;
}

@end
