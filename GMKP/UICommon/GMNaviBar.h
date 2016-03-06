//
//  GHWNaviBar.h
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMTabbarBtn.h"
@interface GMNaviBar : UIView
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)UILabel* titleLable;
@property(nonatomic,strong)GMTabbarBtn* leftBtn;
@property(nonatomic,strong)GMTabbarBtn* rightBtn;
@property(nonatomic)float naviBarH;
@end
