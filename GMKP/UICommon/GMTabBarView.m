//
//  GHWTabBarView.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMTabBarView.h"
#import "GMContentView.h"
#import "GMHelper.h"
//static GMTabBarView* gmTabBarView;
@interface GMTabBarView()
@property(nonatomic)float tabBarHMax;
@property(nonatomic,weak)UIView* viewSelected;
@property(nonatomic)CGRect curFrame;
@end
@implementation GMTabBarView
@synthesize naviBar = _naviBar;
@synthesize tabBarH = _tabBarH;
@synthesize contentViews = _contentViews;
@synthesize homePage = _homePage;
//+(instancetype)shareInstance{
//    if (!gmTabBarView) {
//        gmTabBarView = [[GMTabBarView alloc]init];
//    }
//    return gmTabBarView;
//}

-(CGRect)getContentViewFrame{
    float statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    float naviBarH = [GMHelper getCurrentVC].navigationController.navigationBar.bounds.size.height;
    float viewH = [UIScreen mainScreen].bounds.size.height - statusBarH - naviBarH;
    float viewW = [UIScreen mainScreen].bounds.size.width;
    
    return CGRectMake(0,_naviBar.naviBarH , viewW, viewH - _naviBar.naviBarH - _tabBarH);
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

#pragma mark UI
-(void)initUI{
    _naviBar = [[GMNaviBar alloc]init];
    [_naviBar.leftBtn addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
    _tabBarH = 50;
    _tabBarHMax = 80;
    [self addSubview:_naviBar];
    _contentViews = [NSMutableArray array];
}



#pragma mark Layout
-(void)layoutSubviews{
    [super layoutSubviews];
    float statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    float naviBarH = [GMHelper getCurrentVC].navigationController.navigationBar.bounds.size.height;
    float viewH = [UIScreen mainScreen].bounds.size.height - statusBarH - naviBarH;
    float viewW = [UIScreen mainScreen].bounds.size.width;
    self.frame = CGRectMake(0, statusBarH + naviBarH, viewW, viewH);
    
    CGRect frame = _naviBar.frame;
    frame.size.width = viewW;
    _naviBar.frame = frame;
    
    _curFrame = CGRectMake(0,_naviBar.naviBarH , viewW, viewH - _naviBar.naviBarH - _tabBarH);
    
    if ([_homePage isEqual:_viewSelected]) {
        _homePage.frame = _curFrame;
    }
    
    //如果当前已经有显示内容页面,设置该页面布局. 将没被选中的内容页面放在屏幕以外.
    __weak GMTabBarView* weakSelf = self;
    [_contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GMContentView* contentView = obj;
        if (![contentView isEqual:weakSelf.viewSelected]) {
            contentView.frame = CGRectMake(viewW, _naviBar.naviBarH, viewW, viewH - _naviBar.naviBarH - _tabBarH);
        }else{
            contentView.frame = CGRectMake(0, _naviBar.naviBarH, viewW, viewH - _naviBar.naviBarH - _tabBarH);
        }
       
    }];
    
    //tab btn 布局
    if (_contentViews.count > 0) {
        float btnW = viewW/_contentViews.count;
        float btnH = _tabBarH;
        float btnY = viewH - btnH;
        [_contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GMContentView* contentView = obj;
            GMTabbarBtn* btn = contentView.controlBtn;
            [btn removeFromSuperview];
            btn.frame = CGRectMake(idx*btnW, btnY, btnW, btnH);
            [self addSubview:btn];
        }];
    }
}

#pragma mark getter setter
-(float)tabBarH{
    return _tabBarH;
}

-(void)setTabBarH:(float)tabBarH{
    if (tabBarH>0&&tabBarH <= _tabBarHMax) {
        _tabBarH = tabBarH;
//        [self setNeedsLayout];
    }else if (tabBarH>_tabBarHMax){
        _tabBarH = _tabBarHMax;
//        [self setNeedsLayout];
    }
}

-(GMNaviBar *)naviBar{
    return _naviBar;
}

-(void)setNaviBar:(GMNaviBar *)naviBar{
    if (_naviBar != naviBar) {
        [_naviBar removeFromSuperview];
        _naviBar = naviBar;
        [self addSubview:_naviBar];
//        [self setNeedsLayout];
    }
}

-(UIView *)homePage{
    return _homePage;
}

-(void)setHomePage:(GMContentView *)homePage{
    if (![_homePage isEqual:homePage]) {
        [_homePage removeFromSuperview];
        _homePage = homePage;
        _viewSelected = homePage;
        //设置naviBar控制homepage
        _naviBar.leftBtn.contentView = homePage;
        [self addSubview:_homePage];
//        [self setNeedsLayout];
    }
}

-(NSMutableArray *)contentViews{
    return _contentViews;
}

-(void)setContentViews:(NSMutableArray *)contentViews{
    NSMutableArray* tempArray = [NSMutableArray array];
    __weak GMTabBarView* weakSelf = self;
    [contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[GMContentView class]]) {
            GMContentView* contentView = obj;
            contentView.tag = idx + 1;//该tag将用来标识内容页面的排序
            [weakSelf addSubview:contentView];
            [weakSelf addSubview:contentView.controlBtn];
            [contentView.controlBtn addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
            [tempArray addObject:obj];
        }
    }];
    if (tempArray.count>0) {
        [_contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GMContentView* contentView = obj;
            [contentView removeFromSuperview];
            [contentView.controlBtn removeFromSuperview];
        }];
        _contentViews = tempArray;
//        [self setNeedsLayout];
    }
}


#pragma mark Btn Action
-(void)changePage:(GMTabbarBtn*)btn{
    GMContentView* contentView = btn.contentView;

    
    
    
    //内容页面正好是当前显示页面 没有变化
    if ([contentView isEqual:_viewSelected]) {
        return;
    }
    
    
    [_contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GMContentView* contentView = obj;
        
        if (![contentView.controlBtn isEqual:btn]) {
            [contentView.controlBtn setIsSelected:NO];
        }else{
            [contentView.controlBtn setIsSelected:YES];
        }
    }];
    
    
    
    CGRect preFrame = contentView.frame;//内容页面进入屏幕之前的位置
    CGRect curFrameDismiss = contentView.frame;//当前页面推出屏幕的位置
    //如果该内容页面排在当前显示页面的后面,那么页面将从屏幕右边进入,否则将从屏幕左边进入
    if (contentView.tag > _viewSelected.tag) {
        preFrame.origin.x = self.bounds.size.width;
        curFrameDismiss.origin.x = -self.bounds.size.width;
    }else{
        preFrame.origin.x = -self.bounds.size.width;
        curFrameDismiss.origin.x = self.bounds.size.width;
    }
    
    __weak GMTabBarView* weakSelf = self;
    
    if ([btn isEqual:self.naviBar.leftBtn]||[btn.btnTitle isEqualToString:@"马拉松"]) {
        self.naviBar.title = @"莞马智跑";
    }else{
        self.naviBar.title = btn.btnTitle;
    }
    
    
    contentView.frame = preFrame;
    [UIView animateWithDuration:.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        contentView.frame = [weakSelf getContentViewFrame];
        weakSelf.viewSelected.frame = curFrameDismiss;
    } completion:^(BOOL finished) {
        
    }];
    
    _viewSelected = contentView;
    
}



@end
