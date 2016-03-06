//
//  GHWTopBottomView.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMTopBottomView.h"

@implementation GMTopBottomView
@synthesize topView = _topView;
@synthesize bottomView = _bottomView;
@synthesize topViewHeight = _topViewHeight;
@synthesize midSpace = _midSpace;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

#pragma mark UI
-(void)initUI{
    _topView = [[UIView alloc]init];
    [self addSubview:_topView];
    _bottomView = [[UIView alloc]init];
    [self addSubview:_bottomView];
}

#pragma mark Layout
-(void)layoutSubviews{
    [super layoutSubviews];
    float viewH = self.bounds.size.height;
    float viewW = self.bounds.size.width;
    
    self.topView.frame = CGRectMake(0, 0, viewW, _topViewHeight);
    self.bottomView.frame = CGRectMake(0, _topViewHeight + _midSpace, viewW, viewH - _topViewHeight - _midSpace);
}

#pragma mark setter getter

-(UIView *)topView{
    return _topView;
}

-(void)setTopView:(UIView *)topView{
    if (_topView!=topView) {
        [_topView removeFromSuperview];
        _topView = topView;
        [self addSubview:_topView];
//        [self setNeedsLayout];
    }
}

-(UIView *)bottomView{
    return _bottomView;
}

-(void)setBottomView:(UIView *)bottomView{
    if (_bottomView != bottomView) {
        [_bottomView removeFromSuperview];
        _bottomView = bottomView;
        [self addSubview:_bottomView];
//        [self setNeedsLayout];
    }
}

-(float)topViewHeight{
    return _topViewHeight;
}

-(void)setTopViewHeight:(float)topViewHeight{
    if (topViewHeight>=0) {
        _topViewHeight = topViewHeight;
//        [self setNeedsLayout];
    }
}

-(float)midSpace{
    return _midSpace;
}

-(void)setMidSpace:(float)midSpace{
    if (midSpace>=0) {
        _midSpace = midSpace;
//        [self setNeedsLayout];
    }
}




@end
