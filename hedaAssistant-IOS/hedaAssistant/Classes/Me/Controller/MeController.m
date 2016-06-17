//
//  MeController.m
//  hedaAssistant
//
//  Created by bear on 16/3/31.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MeController.h"
#import "MeHeaderView.h"
#import "SettingController.h"
#import "UIBarButtonItem+CC.h"

#import "UIScrollView+ScalableCover.h"
#import "AppDelegate.h"
#import "CCNavigationController.h"

@interface MeController ()

@property (nonatomic, strong) NSArray *data;

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;


    self.plsitName=@"MeSet";

    MeHeaderView *header=[[MeHeaderView alloc]init];

    header.frame=CGRectMake(0, 0, SCREEN_WIDTH,200);

    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];

    self.tableView.tableHeaderView=header;


     UIBarButtonItem *settingBtn =  [UIBarButtonItem itemWithIcon:@"ic_navigation_setting_normal" highlightedIcon:@"ic_navxigation_setting_normal" target:self action:@selector(popSetting)];


    self.navigationItem.rightBarButtonItem=settingBtn;
    [self setCoverImage];


    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear_bg"] forBarMetrics:UIBarMetricsDefault];

}




//隐藏
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
//显示
- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background"] forBarMetrics:UIBarMetricsDefault];
}





- (void)setCoverImage
{


    NSNumber *screenWidth = @([UIScreen mainScreen].bounds.size.width);
    NSString *imageName = @"mebg";
    if (screenWidth.intValue < 400) {
        imageName = [NSString stringWithFormat:@"%@", imageName];;
    }

    if (((AppDelegate *)[UIApplication sharedApplication].delegate).inNightMode) {
        imageName = [NSString stringWithFormat:@"%@-dark", imageName];
    }

    if (!self.tableView.scalableCover) {
        [self.tableView addScalableCoverWithImage:[UIImage imageNamed:imageName]];
    } else {
        self.tableView.scalableCover.image = [UIImage imageNamed:imageName];
    }
}




-(void)popSetting{

    
    
    
    CCNavigationController *nav =[[CCNavigationController alloc]initWithRootViewController:[[SettingController alloc]initWithStyle:UITableViewStyleGrouped]];
    [self.navigationController presentViewController:nav animated:YES completion:nil];

    
}





@end
