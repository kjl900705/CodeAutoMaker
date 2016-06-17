//
//  MeController.m
//  hedaAssistant
//
//  Created by bear on 15/11/28.
//  Copyright © 2015年 bear. All rights reserved.
//

#import "SettingController.h"
#import "UINavigationItem+custom.h"
#import "LoginController.h"


@implementation SettingController



-(void)viewDidLoad{
    [super viewDidLoad];


    self.title=@"设置";

    self.plsitName=@"Setting";

    [self addFooter];
    
    
    
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc ]initWithTitle:@"关闭" style: UIBarButtonItemStylePlain target:self action:@selector(colseSelf)];



}


-(void)colseSelf{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addFooter{


    UIView *footer=[[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 120)];

    UIButton *logOutBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 10,SCREEN_WIDTH-20, 44)];
    logOutBtn.backgroundColor=COLOR(204, 51, 51, 0.7);
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [footer addSubview:logOutBtn];

    [logOutBtn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchDown];

    UILabel *copyRightLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH-20, 44)];
    copyRightLable.textAlignment=NSTextAlignmentCenter;
    copyRightLable.font=[UIFont systemFontOfSize:12];
    [copyRightLable setText:@"Copy Right   @小才abc \n  QQ15223245"];
    copyRightLable.numberOfLines=0;
    [copyRightLable setTextColor:[UIColor grayColor]];

    [footer addSubview:copyRightLable];

    self.tableView.tableFooterView=footer;

}





-(void)logOut{

    [UIApplication sharedApplication].keyWindow.rootViewController=[[LoginController alloc]init];


}



@end
