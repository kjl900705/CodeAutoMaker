//
//  NoticeCell.h
//  hedaAssistant
//
//  Created by bear on 16/4/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Notice;

@interface NoticeCell : UITableViewCell


@property (nonatomic, strong) Notice *notice;


+ (instancetype)cellWithTableView:(UITableView *)tableVeiw;

@end
