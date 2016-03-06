//
//  GHWNaviBar.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMNaviBar.h"
@interface GMNaviBar()
@property(nonatomic)float rightBtnWidth;
@property(nonatomic)float leftBtnWidth;
@end
@implementation GMNaviBar
@synthesize title = _title;
@synthesize leftBtn = _leftBtn;
@synthesize rightBtn =  _rightBtn;
@synthesize titleLable = _titleLable;
@synthesize naviBarH = _naviBarH;

-(instancetype)init{
    self = [super init];
    if (self) {
        _naviBarH = 30;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _naviBarH);
        [self initUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _naviBarH = frame.size.height;
        [self initUI];
    }
    return self;
}

#pragma mark setter getter

-(GMTabbarBtn *)rightBtn{
    return _rightBtn;
}

-(void)setRightBtn:(GMTabbarBtn *)rightBtn{
    if (_rightBtn!= rightBtn) {
        [_rightBtn removeFromSuperview];
        _rightBtnWidth = rightBtn.bounds.size.width;
        _rightBtn = rightBtn;
        [self addSubview:_rightBtn];
//        [self setNeedsLayout];
    }
}

-(GMTabbarBtn *)leftBtn{
    return _leftBtn;
}

-(void)setLeftBtn:(GMTabbarBtn *)leftBtn{
    if (_leftBtn!=leftBtn) {
        [_leftBtn removeFromSuperview];
        _leftBtnWidth = leftBtn.bounds.size.width;
        _leftBtn = leftBtn;
        [self addSubview:_leftBtn];
//        [self setNeedsLayout];
    }
}

-(NSString *)title{
    return _title;
}

-(void)setTitle:(NSString *)title{
    if (_title!= title) {
        [_titleLable setText:title];
    }
}

-(UILabel *)titleLable{
    return _titleLable;
}


-(void)setTitleLable:(UILabel *)titleLable{
    if (_titleLable != titleLable) {
        [_titleLable removeFromSuperview];
        _titleLable = titleLable;
        [self addSubview:_titleLable];
//        [self setNeedsLayout];
    }
}

-(float)naviBarH{
    return _naviBarH;
}

-(void)setNaviBarH:(float)naviBarH{
    if (naviBarH >= 0) {
        _naviBarH = naviBarH;
//        [self setNeedsLayout];
    }
}

-(void)initUI{
    self.backgroundColor = [UIColor lightGrayColor];
    _rightBtnWidth = 50;
    _leftBtnWidth = 50;
    _titleLable = [[UILabel alloc]init];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_titleLable];
    _leftBtn = [[GMTabbarBtn alloc]init];
//    _leftBtn.backgroundColor = [UIColor redColor];
    [self addSubview:_leftBtn];
    _rightBtn = [[GMTabbarBtn alloc]init];
//    _rightBtn.backgroundColor = [UIColor redColor];
    [self addSubview:_rightBtn];
    
}




-(void)layoutSubviews{
    [super layoutSubviews];
    float viewH = _naviBarH;
    float viewW = self.bounds.size.width;
    self.bounds = CGRectMake(0, 0, viewW, viewH);
    float left_x = 0;
    float left_y = 0;
    float left_w = _leftBtnWidth;
    float left_h = viewH;
    _leftBtn.frame = CGRectMake(left_x, left_y, left_w, left_h);
    
    _titleLable.frame = self.bounds;
    
    float right_x = viewW - _rightBtnWidth;
    float right_y = 0;
    float right_w = _rightBtnWidth;
    float right_h = viewH;
    _rightBtn.frame = CGRectMake(right_x, right_y, right_w, right_h);
}

@end
