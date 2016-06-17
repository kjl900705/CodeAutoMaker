//
//  UIView+CC.m
//  hedaAssistant
//
//  Created by bear on 16/4/3.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "UIView+CC.h"

@implementation UIView (CC)

-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x{
    CGRect rect=self.frame;
    rect.origin.x=x;
    self.frame=rect;
}



-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGRect rect=self.frame;
    rect.origin.y=y;
    self.frame=rect;

}


-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{
    CGRect rect=self.frame;
    rect.size.width=width;
    self.frame=rect;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{
    CGRect rect=self.frame;
    rect.size.height=height;
    self.frame=rect;
}



- (UIButton *)addButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    return button;
}

- (UIView *)addView{
    UIView *view = [[UIView alloc]init];
    [self addSubview:view];
    return view;
}

- (UILabel *) addLabel{
    UILabel *label = [[UILabel alloc]init];
    [self addSubview:label];
    return label;
}

- (UIImageView *) addImageView{
    UIImageView *imageView =[[UIImageView alloc]init];
    [self addSubview:imageView];
    return imageView;
}

- (UITextField *) addTextFiled{
    UITextField *textfield = [[UITextField alloc]init];
    [self addSubview:textfield];
    return textfield;
}

@end
