//
//  CampusController.m
//  hedaAssistant
//
//  Created by bear on 15/11/28.
//  Copyright © 2015年 bear. All rights reserved.
//


#import "NewsController.h"
#import "NewsDetailController.h"
#import <MJRefresh.h>
#import "UINavigationItem+custom.h"
#import "News.h"
#import "XCNewsCell.h"




@interface NewsController ()
@property(nonatomic,strong)NSMutableArray *newsList;
@end

@implementation NewsController



-(void)viewDidLoad{
    [super viewDidLoad];
    [self setUI];

    self.tableView.backgroundColor=COLOR(255, 255, 255, 0.1);
    self.tableView.rowHeight=116;
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self refreash];
    }];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];

    

}





-(void)setUI{

    //设置  导航栏的背景

    [self.navigationController.navigationBar setBarTintColor:COLOR(12, 165, 219, 0.8)];
    //设置自己的标题
    [self.navigationItem setMyTitle:@"校园"];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



    return self.newsList.count;


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XCNewsCell *cell=[XCNewsCell cellWithTableView:tableView];
    cell.news=self.newsList[indexPath.row];
    


    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailController *newsDetailVc=[[NewsDetailController alloc]init];
    newsDetailVc.news=self.newsList[indexPath.row];


    [self.navigationController showViewController:newsDetailVc sender:nil];
}



#pragma mark 懒加载数据
-(NSMutableArray *)newsList{
    if (_newsList==nil) {
        NSURL *url=[[NSBundle mainBundle] URLForResource:@"newsList" withExtension:@"plist"];
        _newsList =[NSMutableArray arrayWithContentsOfURL:url];

        NSMutableArray *arrM=[NSMutableArray array];

        for (NSDictionary *dict in  _newsList) {
            News *model=[News newsWithDict:dict];
            [arrM addObject:model];

        }


        _newsList=arrM;

    }

    return _newsList;
    
}



-(void)loadMore{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [_newsList addObjectsFromArray:_newsList];
        [self.tableView reloadData];

        [self.tableView.mj_footer endRefreshing];
    });

}

-(void)refreash{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self.tableView.mj_header endRefreshing];
    });
    
}

@end
