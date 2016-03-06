//
//  GMMenuView.h
//  test
//
//  Created by Wuyixin on 16/3/6.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMMenuView : UIView
@property(nonatomic)float topBarH;
@property(nonatomic,strong)UIColor* topBarColor;
@property(nonatomic,strong)NSMutableArray* menuBtns;
@property(nonatomic)float menuWidth;
@property(nonatomic)float btnH;
+(instancetype)shareInstance;
+(void)show;
@end
