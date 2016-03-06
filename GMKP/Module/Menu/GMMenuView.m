//
//  GMMenuView.m
//  test
//
//  Created by Wuyixin on 16/3/6.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMMenuView.h"
#import "GMHelper.h"
#import "GMMenuBtn.h"
static GMMenuView* _gmMenuView;
@interface GMMenuView()
@property(nonatomic,strong)UIView* topBar;
@property(nonatomic,strong)UIView* menuViewFrame;
@property(nonatomic,strong)UIView* maskView;
@property(nonatomic)CGRect curFrame;
@property(nonatomic,strong)UIColor* maskColor;
@end
@implementation GMMenuView
@synthesize menuBtns = _menuBtns;

+(instancetype)shareInstance{
    if (!_gmMenuView) {
        _gmMenuView = [[GMMenuView alloc]init];
        
        GMMenuBtn* btn1 = [[GMMenuBtn alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
        btn1.image = [UIImage imageNamed:@"discover1.png"];
        [btn1.btnTitleLable setText:@"登陆/注册"];
        //    [self.view addSubview:btn];
        GMMenuBtn* btn2 = [[GMMenuBtn alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
        btn2.image = [UIImage imageNamed:@"discover2.png"];
        [btn2.btnTitleLable setText:@"联系我们"];
        
        GMMenuBtn* btn3 = [[GMMenuBtn alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
        btn3.image = [UIImage imageNamed:@"discover3.png"];
        [btn3.btnTitleLable setText:@"意见反馈"];
        
        GMMenuBtn* btn4 = [[GMMenuBtn alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
        btn4.image = [UIImage imageNamed:@"discover4.png"];
        [btn4.btnTitleLable setText:@"版本更新"];

        _gmMenuView.menuBtns = [NSMutableArray arrayWithArray:@[btn1,btn2,btn3,btn4]];
    }
    return _gmMenuView;
    
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

-(void)initUI{
    _maskView = [[UIView alloc]init];
    _maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
    _maskView.backgroundColor = _maskColor;
    UITapGestureRecognizer* tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(disappear)];
    [_maskView addGestureRecognizer:tapGR];
    [self addSubview:_maskView];
//    self.backgroundColor = [UIColor lightGrayColor];
    
    _menuViewFrame = [[UIView alloc]init];
    _menuViewFrame.backgroundColor = [UIColor whiteColor];
    [self addSubview:_menuViewFrame];
    _topBarColor = [UIColor greenColor];
    _topBar = [[UIView alloc]init];
    _topBar.backgroundColor = _topBarColor;
    [_menuViewFrame addSubview:_topBar];
    
    _topBarH = 30;
    _btnH = 60;
    _menuBtns = [NSMutableArray array];
    _menuWidth = 150;
//    [self setNeedsLayout];
}

-(void)setMenuBtns:(NSMutableArray *)menuBtns{
    if (![_menuBtns isEqual:menuBtns]) {
        [_menuBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton* btn = obj;
                [btn removeFromSuperview];
            }
        }];
        _menuBtns = nil;
        _menuBtns = menuBtns;
        [_menuBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton* btn = obj;
                [self.menuViewFrame addSubview:btn];
            }
        }];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    float statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    float naviBarH = [GMHelper getCurrentVC].navigationController.navigationBar.bounds.size.height;
    float viewH = [UIScreen mainScreen].bounds.size.height - statusBarH - naviBarH;
    float viewW = [UIScreen mainScreen].bounds.size.width;
    
    self.frame = CGRectMake(0, statusBarH + naviBarH, viewW, viewH);
    
    _maskView.frame = CGRectMake(0, 0, viewW, viewH);
    
    float menu_f_x = viewW - _menuWidth;
    float menu_f_y = 0;
    float menu_f_w = _menuWidth;
    float munu_f_h = viewH;
    _menuViewFrame.frame = CGRectMake(menu_f_x, menu_f_y, menu_f_w, munu_f_h);
    _curFrame = _menuViewFrame.frame;

    
    float topbar_x = 0;
    float topbar_y = 0;
    float topbar_w = menu_f_w;
    float topbar_h = _topBarH;
    self.topBar.frame = CGRectMake(topbar_x, topbar_y, topbar_w, topbar_h);
    
    __weak GMMenuView* weakSelf = self;
    [_menuBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton* btn = obj;
        float btn_x = 0;
        float btn_y = idx * weakSelf.btnH + weakSelf.topBarH;
        float btn_w = weakSelf.menuWidth;
        float btn_h = weakSelf.btnH;
        btn.frame = CGRectMake(btn_x, btn_y, btn_w, btn_h);
    }];
}

+(void)show{
    
    GMMenuView* menuView = [GMMenuView shareInstance];
    
    UIViewController* currentVC = [GMHelper getCurrentVC];
    [currentVC.view addSubview:menuView];
    float screenW = [UIScreen mainScreen].bounds.size.width;
    CGRect preFrame = menuView.menuViewFrame.bounds;
    preFrame.origin.x = screenW;
    menuView.menuViewFrame.frame = preFrame;
    
    menuView.maskView.backgroundColor = [UIColor clearColor];
    
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        menuView.menuViewFrame.frame = menuView.curFrame;
        menuView.maskView.backgroundColor = menuView.maskColor;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)disappear{
    
    float screenW = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = _menuViewFrame.bounds;
    frame.origin.x = screenW;
    
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _menuViewFrame.frame = frame;
        _maskView.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



@end
