//
//  BasePlistCell.h
//  hedaAssistant
//
//  Created by bear on 16/4/7.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SectionHeader @"SectionHeader"
#define SectionFooter @"SectionFooter"
#define Items @"Items"

#define Icon @"Icon"
#define Title @"Title"
#define AccessoryType @"AccessoryType"
#define AccessoryName @"AccessoryName"
#define TargetVc @"TargetVc"
#define PlistName @"PlistName"
#define CellStyle @"CellStyle"
#define Data_key  @"Data_key"
#define FunctionName @"FunctionName"
#define Describe @"Describe"



@interface BasePlistCell : UITableViewCell



+ (instancetype)cellWithTableView:(UITableView *)tableVeiw item:(NSDictionary *)item;
@end
