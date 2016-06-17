//
//  MeController.m
//  hedaAssistant
//
//  Created by bear on 15/11/28.
//  Copyright © 2015年 bear. All rights reserved.
//

#import "MeController.h"
#import "UINavigationItem+custom.h"
#import "LoginController.h"

@implementation MeController



-(void)viewDidLoad{
    [super viewDidLoad];

    [self setUI];
    [self loadPlist];
    [self setMytableStyle];



}

-(void)setMytableStyle{

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainBg"]];

    self.tableView.backgroundColor=COLOR(255, 255, 255, 0.3);

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


#pragma mark    初始化视图
-(void)setUI{


    [self.navigationController.navigationBar setBarTintColor:COLOR(12, 165, 219, 0.8)];

    //设置自己的标题
    [self.navigationItem setMyTitle:@"个人中心"];


}


#pragma mark   读取plist
-(void)loadPlist{
    NSURL  *url=  [[NSBundle mainBundle] URLForResource:@"Me" withExtension:@"plist"];
    _data=[NSArray arrayWithContentsOfURL:url];

}


#pragma mark   返回部分个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _data.count;
}



#pragma mark   返回每个部分的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_data[section] count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor=COLOR(255, 255, 255, 0.6);
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict=_data[indexPath.section][indexPath.row];
    cell.textLabel.text= dict[@"name"];
    NSLog(@"⭐️⭐️⭐️%@",dict[@"name"]);



    return cell;
}





#pragma mark 选中该行执行的动作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath!=nil) {
        UIAlertView *promptAlert =[[UIAlertView alloc]initWithTitle:nil message:_data[indexPath.section][indexPath.row][@"name"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

        [promptAlert show];
    }
}



-(void)logOut{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         self.view.window.rootViewController=[[LoginController alloc]init];
    });
}



@end
