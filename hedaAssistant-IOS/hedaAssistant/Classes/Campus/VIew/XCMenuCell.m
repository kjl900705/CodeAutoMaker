//
//  XCMenuCell.m
//  hedaAssistant
//
//  Created by bear on 16/3/31.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "XCMenuCell.h"

@implementation XCMenuCell

+ (instancetype)cellWithTableView:(UITableView *)tableVeiw {
    static NSString *ID = @"MenuCell";
    XCMenuCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"XCMenuCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
