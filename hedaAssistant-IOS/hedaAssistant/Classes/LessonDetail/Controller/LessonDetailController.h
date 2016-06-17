//
//  LessonDetailController.h
//  hedaAssistant
//
//  Created by bear on 16/3/25.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrangeButton.h"

@interface LessonDetailController : UITableViewController
@property (nonatomic,weak)ArrangeButton *button;
@property (nonatomic, strong) Exam *exam;
@end
