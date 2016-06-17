//
//  MainController.m
//  新浪微博
//
//  Created by 40  on 15/11/23.
//  Copyright © 2015年 bear. All rights reserved.
//

#import "MainController.h"
#import "TableController.h"
#import "NewsController.h"
#import "MeController.h"
#import "CampusController.h"



@interface MainController ()<CCTabBarDelegate>
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, weak) UIView *leftView;

@property (nonatomic, strong) id popDelegate;


@property (nonatomic, assign) CGPoint prePoint;

@end

@implementation MainController


- (void)viewDidLoad {

    [super viewDidLoad];

    self.childControllerAndIconArr=@[
                                     @{
                                         VIEWCONTROLLER : [[TableController alloc]init],  //控制器
                                         NORMAL_ICON : @"icon_classTable",                 //正常状态的Icon 名称
                                         SELECTED_ICON : @"icon_classTable_selected",       //选中状态的Icon 名称
                                         TITLE : @"表"                                       //Nav和Tab的标题
                                         },
                                     @{
                                         VIEWCONTROLLER : [[CampusController alloc]init],
                                         NORMAL_ICON : @"icon_discover",
                                         SELECTED_ICON : @"icon_discover_selected",
                                         TITLE : @"校园"
                                         },
                                     @{
                                         VIEWCONTROLLER : [[MeController alloc]initWithStyle:UITableViewStyleGrouped],
                                         NORMAL_ICON : @"icon_me",
                                         SELECTED_ICON : @"icon_me_selected",
                                         TITLE : @"我"
                                         }
                                     ];


}



@end
