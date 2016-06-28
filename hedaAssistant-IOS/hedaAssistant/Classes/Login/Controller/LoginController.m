//
//  LoginController.m
//  hedaAssistant
//
//  Created by bear on 15/11/29.
//  Copyright © 2015年 bear. All rights reserved.
//

#import "LoginController.h"
#import "MainController.h"
#import "KeychainItemWrapper.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "User.h"
#import "AppDelegate.h"



@interface LoginController ()

@property (nonatomic, strong)UITextField *uid;
@property (nonatomic, strong)UITextField *pwd;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) KeychainItemWrapper *keychain;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title=@"登录";

    [self setUI];

    self.keychain=[[KeychainItemWrapper alloc] initWithIdentifier:@"hedaUser" accessGroup:nil];
    self.uid.text=[_keychain objectForKey:(id)kSecAttrAccount];
    self.pwd.text=[_keychain objectForKey:(id)kSecValueData];


}

-(void)setUI{


    CGFloat startY=0;



    _uid = [self.view addTextFiled];
    _uid.text=@"1345030253";
    _uid.frame = CGRectMake(0, 80+startY, SCREEN_WIDTH, 44);
    [_uid setAlpha:0.8f];
    [_uid setBorderStyle:UITextBorderStyleRoundedRect];
    [_uid setPlaceholder:@"请输入工号/学号:"];
    _uid.textAlignment=NSTextAlignmentCenter;
    [_uid becomeFirstResponder];
    _uid.keyboardType=UIKeyboardTypeNumberPad;
    _uid.backgroundColor=[UIColor whiteColor];


    _pwd = [self.view addTextFiled];
    _pwd.text=@"test";
    _pwd.frame = CGRectMake(0, 80+44+startY, SCREEN_WIDTH, 44);
    [_pwd setAlpha:0.8f];
    [_pwd setPlaceholder:@"密码"];
    _pwd.textAlignment=NSTextAlignmentCenter;
    [_pwd setKeyboardType:UIKeyboardTypeAlphabet];
    [_pwd setBorderStyle:UITextBorderStyleRoundedRect];
    [_pwd setSecureTextEntry:YES];
    _pwd.keyboardType=UIKeyboardAppearanceDefault;
    _pwd.backgroundColor=[UIColor whiteColor];

    


    self.loginBtn =[self.view addButton];

    self.loginBtn.frame = CGRectMake(20, 80+44*2+20+startY, SCREEN_WIDTH-40, 44);

    self.loginBtn.backgroundColor=[UIColor brownColor];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];

    [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_background"] forState:UIControlStateNormal];
    self.loginBtn.backgroundColor=[UIColor lightGrayColor];
    [self.loginBtn setAlpha:0.8f];
    [self.loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];


    
}




-(void)loginClick{

    [self.view endEditing:YES];

    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];

        hub.labelText=@"登录中";
        hub.dimBackground=YES;


        NSString *uid=_uid.text;
        NSString *pwd=_pwd.text;


    //保存帐号
    [_keychain setObject:uid forKey:(id)kSecAttrAccount];

    //保存密码
    [_keychain setObject:pwd forKey:(id)kSecValueData];


    

    NSString *serviceName=@"User.GetBaseInfo";
    NSString *urlStr=[NSString stringWithFormat:@"%@%@",ApiHost,serviceName];

    NSDictionary *parmas = @{ @"user_id":uid, @"user_pwd":pwd};

    NSLog(@"%@",urlStr);

    [CCHttpTool POST:urlStr parameters:parmas success:^(id responseObject) {




        NSNumber *statusCode=responseObject[@"ret"];


        NSLog(@"statusCode :%@",statusCode);


        if ([statusCode  isEqual: @(200)]) {

            if ([responseObject[@"data"][@"code"] isEqualToNumber:@(0)]) {
                //获取用户字典
                NSDictionary *userInfo=responseObject[@"data"][@"info"];


                User *user = [User userWithDict:userInfo];


                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];


                ((AppDelegate *)[UIApplication sharedApplication].delegate).user_id=user.user_id;

                [userDefaults setInteger:user.user_id forKey:@"user_id"];
                [userDefaults setObject:user.user_name forKey:@"user_name"];
                [userDefaults setInteger:user.user_phone forKey:@"user_phone"];
                [userDefaults setObject:user.user_pwd forKey:@"user_pwd"];
                [userDefaults setObject:user.user_email forKey:@"user_email"];
                [userDefaults synchronize];


                
                //切换控制器
                MainController *mainVc=[[MainController alloc]init];
                [UIApplication sharedApplication].keyWindow.rootViewController=mainVc;

            }else{

                  hub.labelText=@"该用户不存在";
            }
            

        }else if ([statusCode  isEqual: @(500)]){

        }else if ([statusCode  isEqual: @(400)]){
            hub.labelText=@"服务器响应失败";
        }





        [hub hide:YES afterDelay:2];



    } failure:^(NSError *error) {

        hub.mode=MBProgressHUDModeCustomView;

        hub.labelText=@"用户名或密码错误";

        [hub hide:YES afterDelay:1];
        CCLog(@"falied");
    }];





}


@end
