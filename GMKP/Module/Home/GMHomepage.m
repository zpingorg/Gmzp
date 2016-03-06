//
//  GMHomepage.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMHomepage.h"
#import "GMTabBarView.h"
#import "GMTopBottomView.h"
#import "GMMainUI.h"
@interface GMHomepage()
@property(nonatomic,strong)GMTopBottomView* contentView;
@property(nonatomic,strong)UILabel* label;
@end
@implementation GMHomepage
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPage];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initPage];
    }
    return self;
}

-(void)initPage{
    _contentView = [[GMTopBottomView alloc]init];
    [self addSubview:_contentView];
    UILabel* label = [[UILabel alloc]init];
    [label setText:@"Homepage"];
    [label setTextAlignment:NSTextAlignmentCenter];
    _label = label;
    [_contentView.bottomView addSubview:label];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    GMMainUI* mainUI = [GMMainUI shareInstance];
    CGRect frame = [mainUI getContentViewFrame];
    float contentH = frame.size.height;
    float bottomH = 80;
    float topH = contentH - bottomH;
    _contentView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    _contentView.bottomView.backgroundColor = [UIColor lightGrayColor];
    
    _label.frame = _contentView.bottomView.bounds;
    
    _contentView.topView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_bg.png"]];
    _contentView.topViewHeight = topH;
}


@end
