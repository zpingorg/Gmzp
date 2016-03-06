//
//  GHWHelper.h
//  GHWSdk
//
//  Created by GHW-T-01 on 15/5/21.
//  Copyright (c) 2015年 Wuyx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface GMHelper : NSObject
+(UIViewController *)getCurrentVC;
+(void)addOrientationNotification:(id)observer selector:(SEL)selector object:(id)object;
+(void)removeOrientationNotification:(id)observer object:(id)object;
@end
