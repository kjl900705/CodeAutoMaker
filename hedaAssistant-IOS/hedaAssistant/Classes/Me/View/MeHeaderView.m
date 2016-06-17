//
//  MeHeaderView.m
//  hedaAssistant
//
//  Created by bear on 16/4/1.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MeHeaderView.h"

@implementation MeHeaderView


- (instancetype)init
{
    self = [super init];
    if (self) {

        UIButton *headImg=[UIButton buttonWithType:UIButtonTypeCustom];
        headImg.frame=CGRectMake(0, 0, 100, 100);
        headImg.center=CGPointMake(SCREEN_WIDTH*0.5, SCREEN_WIDTH*0.2);
        [headImg setImage:[UIImage imageNamed:@"headImg"] forState:UIControlStateNormal];
        headImg.layer.cornerRadius=50;
        headImg.clipsToBounds=YES;
        [self addSubview:headImg];
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}



@end
