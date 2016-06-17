//
//  AddNoticeController.m
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "AddNoticeController.h"
#import "Notice.h"


@interface AddNoticeController ()
@property (weak, nonatomic) IBOutlet UITextField *noticeName;
@property (weak, nonatomic) IBOutlet UITextField *noticeTime;

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toobar;



@end

@implementation AddNoticeController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"添加提醒";
    [self.noticeName becomeFirstResponder];

    self.noticeTime.inputView=self.datePicker;



    self.noticeTime.inputAccessoryView=[self createToolBar];


}


- (IBAction)addBtnClick {

    Notice *notice=[[Notice alloc]init];
    notice.name=self.noticeName.text;
    notice.time=self.noticeTime.text;

    self.addNoticeBlock(notice);


    [self.navigationController popViewControllerAnimated:YES];



}





-(UIToolbar *)createToolBar{

    //关键点   item不能点击说明高度,没有设置
    UIToolbar *toobar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];

    UIBarButtonItem *cancel=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonClick)];


    UIBarButtonItem *flexb=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    UIBarButtonItem *done=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmClick)];

    toobar.items=@[cancel,flexb,done];
    
    
    return toobar;
    
}



-(void)cancelButtonClick{
    [self.view endEditing:YES];

}


-(void)confirmClick{
    NSDateFormatter *formater=[[NSDateFormatter alloc]init];
    formater.dateFormat=@"yyyy-MM-DD HH:mm:ss";
    self.noticeTime.text=[formater stringFromDate:self.datePicker.date];
     [self.view endEditing:YES];
}





-(UIDatePicker *)datePicker{
    if (!_datePicker) {
        UIDatePicker *datePicker=[[UIDatePicker alloc]init];
        datePicker.datePickerMode=UIDatePickerModeDateAndTime;
        _datePicker=datePicker;



    }

    return _datePicker;
    
    
}




@end
