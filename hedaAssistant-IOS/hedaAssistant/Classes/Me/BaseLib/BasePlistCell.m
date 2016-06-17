//
//  BasePlistCell.m
//  hedaAssistant
//
//  Created by bear on 16/4/7.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BasePlistCell.h"

@interface BasePlistCell ()

@property (nonatomic, strong) NSDictionary *item;

@end

@implementation BasePlistCell


+ (instancetype)cellWithTableView:(UITableView *)tableVeiw item:(NSDictionary *)item {
    static NSString *ID = @"plistCell";
    BasePlistCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {

    cell = [[BasePlistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];


    }

    cell.item=item;
    return cell;
}




-(void)setItem:(NSDictionary *)item{



    NSLog(@"%@------",item[Icon]);

    [self.imageView setImage:[UIImage imageNamed:item[Icon]]];
    self.textLabel.text=item[Title];

    self.detailTextLabel.text=item[Describe];

    if ([item[AccessoryType] isEqualToString:@"UIImageView"]) {
        UIImageView *accesoryV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:item[AccessoryName]]];
        self.accessoryView=accesoryV;

    }else if([item[AccessoryType] isEqualToString:@"UISwitch"]){
        UISwitch *accessorySwitch=[[UISwitch alloc]init];

        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];

       accessorySwitch.on = [userDefaults boolForKey:item[Data_key]];

        self.accessoryView=accessorySwitch;
        [accessorySwitch addTarget:self action:@selector(saveState:) forControlEvents:UIControlEventValueChanged];

    }
        _item=item;

}



-(void)saveState:(UISwitch *)sender{

    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];

    [userDefaults setBool:sender.isOn forKey:self.item[Data_key]];

    [userDefaults synchronize];

}

@end
