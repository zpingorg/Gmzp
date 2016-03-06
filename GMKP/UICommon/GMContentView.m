//
//  GHWContentView.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMContentView.h"

@implementation GMContentView
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
    _controlBtn = [[GMTabbarBtn alloc]init];
    _controlBtn.contentView = self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

@end
