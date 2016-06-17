//
//  SearchCell.m
//  hedaAssistant
//
//  Created by bear on 16/3/31.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "XCSearchCell.h"

@implementation XCSearchCell


+ (instancetype)cellWithTableView:(UITableView *)tableVeiw {
    static NSString *ID = @"searchCell";
    XCSearchCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"SearchCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
