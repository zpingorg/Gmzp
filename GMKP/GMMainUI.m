//
//  GMMainUI.m
//  GMKP
//
//  Created by Wuyixin on 16/3/6.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMMainUI.h"
#import "GMHomepage.h"
#import "GMMenuView.h"
static GMMainUI* _gmMainUI;

@implementation GMMainUI

+(instancetype)shareInstance{
    if (!_gmMainUI) {
        _gmMainUI = [[GMMainUI alloc]init];
    }
    return _gmMainUI;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self initMainUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initMainUI];
    }
    return self;
}

-(void)initMainUI{
//    GMTabBarView* tabbarView = [GMTabBarView shareInstance];
    self.backgroundColor = [UIColor clearColor];
    self.naviBar.title = @"莞马智跑";
    [self.naviBar.titleLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    self.naviBar.leftBtn.imgNormal = [UIImage imageNamed:@"top_home.png"];
    self.naviBar.leftBtn.space = 5;
    self.naviBar.rightBtn.imgNormal = [UIImage imageNamed:@"top_user.png"];
    [self.naviBar.rightBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    self.naviBar.rightBtn.space = 5;
    self.naviBar.backgroundColor = [UIColor greenColor];
    [self.naviBar.titleLable setTextColor:[UIColor whiteColor]];
    GMContentView* homePage = [[GMHomepage alloc]init];
//    homePage.backgroundColor = [UIColor blueColor];
    
    GMContentView* contentView1 = [[GMContentView alloc]init];
    contentView1.backgroundColor = [UIColor greenColor];
    
    GMTabbarBtn* controlBtn = [[GMTabbarBtn alloc]init];
    controlBtn.imgNormal = [UIImage imageNamed:@"home_main_normal_bg.png"];
    controlBtn.imgHighlight = [UIImage imageNamed:@"home_main_pressed_bg.png"];
    controlBtn.btnTitle = @"马拉松";
    controlBtn.backgMutable = YES;
    controlBtn.contentView = contentView1;
    contentView1.controlBtn = controlBtn;
    
    
    GMContentView* contentView2 = [[GMContentView alloc]init];
    contentView2.backgroundColor = [UIColor redColor];
    
    
    GMTabbarBtn* controlBtn2 = [[GMTabbarBtn alloc]init];
    controlBtn2.imgNormal = [UIImage imageNamed:@"home_enterprise_normal_bg.png"];
    controlBtn2.imgHighlight = [UIImage imageNamed:@"home_enterprise_pressed_bg.png"];
    controlBtn2.btnTitle = @"科技文化";
    controlBtn2.backgMutable = YES;
    controlBtn2.contentView = contentView2;
    contentView2.controlBtn = controlBtn2;
    
    
    
    GMContentView* contentView3 = [[GMContentView alloc]init];
    contentView3.backgroundColor = [UIColor blackColor];
    GMTabbarBtn* controlBtn3 = [[GMTabbarBtn alloc]init];
    controlBtn3.imgNormal = [UIImage imageNamed:@"home_forum_normal_bg.png"];
    controlBtn3.imgHighlight = [UIImage imageNamed:@"home_forum_pressed_bg.png"];
    controlBtn3.btnTitle = @"跑吧";
    controlBtn3.backgMutable = YES;
    controlBtn3.contentView = contentView3;
    contentView3.controlBtn = controlBtn3;
    
    GMContentView* contentView4 = [[GMContentView alloc]init];
    contentView4.backgroundColor = [UIColor whiteColor];
    
    
    GMTabbarBtn* controlBtn4 = [[GMTabbarBtn alloc]init];
    controlBtn4.imgNormal = [UIImage imageNamed:@"home_person_normal_bg.png"];
    controlBtn4.imgHighlight = [UIImage imageNamed:@"home_person_pressed_bg.png"];
    controlBtn4.btnTitle = @"精选";
    controlBtn4.backgMutable = YES;
    controlBtn4.contentView = contentView4;
    contentView4.controlBtn = controlBtn4;
    
    NSArray* contentViews = @[contentView1,contentView2,contentView3,contentView4];
    self.contentViews =[NSMutableArray arrayWithArray:contentViews];
    self.homePage = homePage;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
}


-(void)showMenu{
    [GMMenuView show];
}


@end
