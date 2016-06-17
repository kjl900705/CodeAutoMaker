//
//  UIView+CC.h
//  hedaAssistant
//
//  Created by bear on 16/4/3.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CC)



@property (nonatomic, assign) CGFloat x;

@property (nonatomic,assign)CGFloat y;

@property (nonatomic,assign)CGFloat width;

@property (nonatomic,assign)CGFloat height;


- (UIButton *)addButton;

- (UIView *)addView;

- (UILabel *) addLabel;

- (UIImageView *) addImageView;

- (UITextField *) addTextFiled;

@end
