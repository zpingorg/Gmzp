//
//  ViewController.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "ViewController.h"
#import "GMNaviBar.h"
#import "GMTopBottomView.h"
#import "GMContentView.h"
#import "GMTabBarView.h"
#import "GMHomepage.h"
#import "GMMenuView.h"
#import "GMMainUI.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GMMainUI* mainUI = [GMMainUI shareInstance];
    [self.view addSubview:mainUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
