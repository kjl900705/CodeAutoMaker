//
//  UIImage+CC.h
//  hedaAssistant
//
//  Created by bear on 16/5/2.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CC)

- (UIImage *) tintImageWithColor:(UIColor *)tintColor;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
