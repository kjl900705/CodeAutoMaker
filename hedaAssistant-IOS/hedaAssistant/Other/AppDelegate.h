//
//  AppDelegate.h
//  hedaAssistant
//
//  Created by bear on 15/11/28.
//  Copyright © 2015年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeTuiSdk.h"

#define kGtAppId           @"zEb0aaoJNV6J0c1FmEUGs4"
#define kGtAppKey          @"8KEOuqF3618DV69gU3wRW3"
#define kGtAppSecret       @"eD6GeQ7rfq7aRpEZf2CUD3"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GeTuiSdkDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) BOOL inNightMode;


@property (nonatomic,assign)NSInteger user_id;
@end

