//
//  LessonDetailController.m
//  hedaAssistant
//
//  Created by bear on 16/3/25.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "LessonDetailController.h"
#import "UINavigationItem+custom.h"
#import "TableController.h"
#import "Exam.h"

#import "LessonDeatilHeader.h"
//获取屏幕 宽度、高度
#define CONTENTENT_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define CONTENTENT_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface LessonDetailController()
@property (nonatomic, weak) LessonDeatilHeader *header;


@end

@implementation LessonDetailController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setUI];


}




-(void)setUI{

    LessonDeatilHeader *header=[[[NSBundle mainBundle] loadNibNamed:@"LessonDeatilHeader" owner:nil options:nil] lastObject];


    
    self.tableView.tableHeaderView=header;
    _header=header;
    [self.navigationItem setMyTitle:@"详细信息"];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];

}

-(void)setExam:(Exam *)exam{
    _exam = exam;
     _header.nameText.text = _exam.exam_name;

}

//返回每一个section中cell的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle    reuseIdentifier:cellIdentifier];
        cell.backgroundColor=[UIColor clearColor];
        cell.detailTextLabel.font=[UIFont systemFontOfSize:24];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.row) {

        case 0:
                    cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
            cell.textLabel.text = @"考试时间:";
            cell.imageView.image = [UIImage imageNamed:@"clock.png"];
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%@\n%@-%@",_exam.exam_date,_exam.exam_startTime,_exam.exam_endTime];
            break;
        case 1:
            cell.textLabel.text=@"监考人:";
            cell.imageView.image=[UIImage imageNamed:@"people.png"];
            cell.detailTextLabel.text=@"监考人";

            break;
        case 2:
            cell.textLabel.text= @"考场人数:";
            cell.imageView.image=[UIImage imageNamed:@"class.png"];
            cell.detailTextLabel.text=@"30";
            break;

        default:
            break;
    }

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {


    return CONTENTENT_HEIGHT*0.15;
}


@end