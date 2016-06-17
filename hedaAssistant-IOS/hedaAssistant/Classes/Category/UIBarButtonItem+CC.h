//
//  UIBarButtonItem+CC.h
//
//
//  Created by bear on 15/11/21.
//  Copyright © 2015年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CC)
-(id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
+(id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;

@end
