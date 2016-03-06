//
//  GHWTopBottomView.h
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMTopBottomView : UIView
@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong)UIView* bottomView;
@property(nonatomic)float topViewHeight;
@property(nonatomic)float midSpace;
@end
