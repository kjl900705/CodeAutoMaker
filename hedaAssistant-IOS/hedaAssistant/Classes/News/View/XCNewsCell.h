//
//  XCNewsCell.h
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface XCNewsCell : UITableViewCell


@property (nonatomic, strong) News *news;


+ (instancetype)cellWithTableView:(UITableView *)tableVeiw ;
@end
