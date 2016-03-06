//
//  GHWTabBarView.h
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMNaviBar.h"
#import "GMContentView.h"
@interface GMTabBarView : UIView
@property(nonatomic,strong)GMNaviBar* naviBar;
@property(nonatomic,strong)NSMutableArray* contentViews;
@property(nonatomic,strong)GMContentView* homePage;
@property(nonatomic)float tabBarH;
//+(instancetype)shareInstance;
-(CGRect)getContentViewFrame;
@end
