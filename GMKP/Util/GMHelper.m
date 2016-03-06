//
//  GHWHelper.m
//  GHWSdk
//
//  Created by GHW-T-01 on 15/5/21.
//  Copyright (c) 2015年 Wuyx. All rights reserved.
//

#import "GMHelper.h"

@implementation GMHelper

+(UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow* window = (UIWindow*)[[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow* tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

+(void)addOrientationNotification:(id)observer selector:(SEL)selector object:(id)object{
    NSString* model = [UIDevice currentDevice].model;
    if (![@"iPhone" isEqualToString:model]) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:observer
                                                 selector:selector
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:object
         ];
    }
    
}
+(void)removeOrientationNotification:(id)observer object:(id)object{
    NSString* model = [UIDevice currentDevice].model;
    if (![@"iPhone" isEqualToString:model]){
        [[NSNotificationCenter defaultCenter] removeObserver:observer
                                                        name:UIDeviceOrientationDidChangeNotification
                                                      object:object
         ];
        [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
    }
}


@end
