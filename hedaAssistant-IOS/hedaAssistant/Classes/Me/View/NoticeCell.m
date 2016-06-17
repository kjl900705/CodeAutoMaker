//
//  NoticeCell.m
//  hedaAssistant
//
//  Created by bear on 16/4/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "NoticeCell.h"
#import "Notice.h"

@implementation NoticeCell



+ (instancetype)cellWithTableView:(UITableView *)tableVeiw {
    static NSString *ID = @"noticeCell";
    NoticeCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

/** 重写自定义cell的初始化方法,让cell一创建出来就有它所需要的子控件 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //cell初始化自定义视图


    }
    return self;
}



-(void)setNotice:(Notice *)notice{
    _notice=notice;

    self.imageView.image=[UIImage imageNamed:@"icon_myLesson"];

    self.textLabel.text=notice.name;

}


@end
