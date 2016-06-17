//
//  TableController.m
//  hedaAssistant
//
//  Created by bear on 15/11/28.
//  Copyright © 2015年 bear. All rights reserved.
//

#import "TableController.h"
#import "LessonDetailController.h"
#import "UINavigationItem+custom.h"
#import "Lesson.h"
#import "Exam.h"
#import "AppDelegate.h"
#import "ArrangeButton.h"

#define  XCTabBarNotifacationIsHiden @"XCTabBarHiden"


//http://test.com/demo/?service=ExamArrange.getExamArrangeByUserID&user_id=1345030253

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//NavBar高度
#define NavigationBar_HEIGHT 44
#define StatusBar_HEIGHT 20
#define TabBar_HEIGHT 49

@interface TableController (){
    UIScrollView *tableScrowView;
    CGFloat  dayWidth;
    CGFloat  sectionHeight;
    NSDictionary *dataDict;

}


@property (nonatomic, strong) NSMutableArray *arrangeList;

@end

@implementation TableController
-(void)viewDidLoad{
    [super viewDidLoad];


    self.view.backgroundColor=COLOR(227, 227, 227, 1);
    [self setUI];
    [self requestData];

}



-(void)setUI{



    CGFloat startY=0;


    //设置自己的标题
    self.title=@"考试安排表";


    //添加顶部星期背景
    UIView *headBg=[[UIView alloc]initWithFrame:CGRectMake(0, startY, SCREEN_WIDTH, 30)];

    headBg.backgroundColor=COLOR(52, 113, 165, 0.7);
    [self.view addSubview:headBg];


    //定义基本宽高
      dayWidth=(CGFloat) (SCREEN_WIDTH-30)/5;
      sectionHeight=(CGFloat)(SCREEN_HEIGHT-(StatusBar_HEIGHT+NavigationBar_HEIGHT+TabBar_HEIGHT)-30)/8;
    
    
#pragma mark    添加ScrowView能左右滚动
    tableScrowView=[[UIScrollView alloc]init];
    tableScrowView.frame=CGRectMake(0, startY, SCREEN_WIDTH,sectionHeight*8+35);
    tableScrowView.contentSize =  CGSizeMake(dayWidth*7+30, 0);
    tableScrowView.bounces=NO;
    [self.view addSubview:tableScrowView];
    

#pragma mark  添加星期头部

    int i;
    NSString *weektitle[]={@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"};
    for(i =0; i<7;i++)
    {
        UIButton *buttonview = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        //为button显示赋值

        [buttonview setTitle:weektitle[i] forState:UIControlStateNormal];
        [buttonview setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //设置button的大小
        buttonview.frame = CGRectMake( 30+i*dayWidth, 0, dayWidth, 30);
        [tableScrowView addSubview:buttonview];

    }


#pragma mark   添加左边节数 标示
    UIView *sectionView=[[UIView alloc]initWithFrame:CGRectMake(0,startY+ 30, 30, sectionHeight*8)];
    [self.view addSubview:sectionView];
    for(i =0; i<8;i++)
    {
        //新建一个button对象 button还有一些别的属性比如背景色
        NSString *title=[NSString stringWithFormat:@"%d",i+1];

        UILabel *numLabel=[[UILabel alloc]init];
        numLabel.backgroundColor=[UIColor lightGrayColor];
        if (i%2) {
            [numLabel setAlpha:0.5f];
        }else{
            [numLabel setAlpha:0.7f];
        }
        numLabel.text=title;
        numLabel.textColor=[UIColor whiteColor];
        numLabel.textAlignment=NSTextAlignmentCenter;
        numLabel.frame = CGRectMake(0, i*sectionHeight, 30, sectionHeight);
        [sectionView addSubview:numLabel];
        
    }


}




#pragma mark   画课表按钮 每节课按照数组画出来
-(void)requestData{


    NSString *serviceName=@"ExamArrange.getExamArrangeByUserID";
    NSString *urlStr=[NSString stringWithFormat:@"%@%@",ApiHost,serviceName];


    NSNumber *user_id= @(((AppDelegate *)[UIApplication sharedApplication].delegate).user_id);

    NSDictionary *params=@{@"user_id":user_id};

    [CCHttpTool POST:urlStr parameters:params success:^(id responseObject) {

        self.arrangeList=responseObject[@"data"][@"info"];

        [self addLesson];



    } failure:^(NSError *error) {


    }];


    

}


-(void)addLesson{

    for (int i=0 ; i<self.arrangeList.count; i++) {
         NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        Exam *exam=self.arrangeList[i];
        NSLog(@"---------%@",exam.exam_endTime);

        NSInteger start=[self getMarkByTimeStr:exam.exam_startTime];
        NSInteger end=[self getMarkByTimeStr:exam.exam_endTime];
        NSLog(@"start%zd",start);
        NSLog(@"%zd",end);

        //将日期转化成星期

        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *date=[dateFormatter dateFromString:exam.exam_date];
        NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
        NSInteger day = [componets weekday];

        CGFloat lessonX=30+ dayWidth*(day-1);
        CGFloat lessonY=30+sectionHeight*(start-1);
        CGFloat lessonH=sectionHeight*(end-start);


        ArrangeButton *buttonBtn=[[ArrangeButton alloc]initWithFrame:CGRectMake(lessonX, lessonY, dayWidth, lessonH)];

        buttonBtn.exam=exam;
        buttonBtn.titleLabel.numberOfLines=0;
        [buttonBtn setTitle:exam.exam_name forState:UIControlStateNormal];


        [buttonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                buttonBtn.backgroundColor=COLOR(255, 99, 99, 0.7);


        [buttonBtn.layer setCornerRadius:8.0];
        [buttonBtn setAlpha:0.7];
        [buttonBtn addTarget:self action:@selector(cellClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonBtn.tag=i;
        [tableScrowView addSubview:buttonBtn];
        
        
    }

}






-(void)setArrangeList:(NSMutableArray *)arrangeList{
        NSMutableArray *arrM=[NSMutableArray array];
    for (NSDictionary *dict in arrangeList) {

        Exam *exam=[Exam examWithDict:dict];
        [arrM addObject:exam];

    }
    _arrangeList=arrM;
}


#pragma mark 响应按钮的点击事件
-(void)cellClick:(ArrangeButton*) button{

    LessonDetailController *tableCell=[[LessonDetailController alloc]init];
    tableCell.view.frame=CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);

    tableCell.exam = button.exam;

    [self.navigationController showViewController:tableCell sender:nil];

}



-(NSInteger)getMarkByTimeStr:(NSString *) timeStr{

    if ([timeStr isEqualToString:@"08:00:00"]) {

        return 1;
    }else if([timeStr isEqualToString:@"09:40:00"]||[timeStr isEqualToString:@"10:20:00"]){

        return 3;
    }else if([timeStr isEqualToString:@"12:00:00"]){

        return 5;
    }else if([timeStr isEqualToString:@"14:00:00"]){

        return 7;
    }else if([timeStr isEqualToString:@"16:00:00"]){

        return 9;
    }


    return 0;

}

@end


