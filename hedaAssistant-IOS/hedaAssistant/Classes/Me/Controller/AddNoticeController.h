//
//  AddNoticeController.h
//  hedaAssistant
//
//  Created by bear on 16/4/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Notice;

typedef void(^AddNoticeBlock)(Notice *notice);


@interface AddNoticeController : UIViewController

@property (nonatomic, copy) AddNoticeBlock addNoticeBlock;
@end
