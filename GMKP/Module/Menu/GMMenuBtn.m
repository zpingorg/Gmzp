//
//  GMMenuBtn.m
//  GMKP
//
//  Created by Wuyixin on 16/3/6.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMMenuBtn.h"
@interface GMMenuBtn()
@property(nonatomic,strong)UIImageView* imgView;
@property(nonatomic,strong)UIView* imgViewFrame;
@property(nonatomic,strong)UIView* bottomLine;
@end
@implementation GMMenuBtn
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
    
    _btnTitleLable = [[UILabel alloc]init];
    [_btnTitleLable setTextAlignment:NSTextAlignmentCenter];
    _btnTitleLable.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_btnTitleLable];
    _imgViewFrame = [[UIView alloc]init];
    [self addSubview:_imgViewFrame];
    _imgView = [[UIImageView alloc]init];
    [_imgViewFrame addSubview:_imgView];
    
    _bottomLine = [[UIView alloc]init];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_bottomLine];
}


-(void)setImage:(UIImage *)image{
    if (![_image isEqual:image]) {
        _image = image;
        [_imgView setImage:image];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    float viewH = self.bounds.size.height;
    float viewW = self.bounds.size.width;
    
    float imgv_x = 0;
    float imgv_y = 0;
    float imgv_w = viewH;
    float imgv_h = viewH;
    _imgViewFrame.frame = CGRectMake(imgv_x, imgv_y, imgv_w, imgv_h);
    
    float space = 5;
    float img_x = space;
    float img_y = space;
    float img_w = imgv_w - 2*space;
    float img_h = imgv_h - 2*space;
    _imgView.frame = CGRectMake(img_x, img_y, img_w, img_h);
    
    float title_x = imgv_x + imgv_w;
    float title_y = 0;
    float title_w = viewW - imgv_w;
    float title_h = viewH;
    _btnTitleLable.frame = CGRectMake(title_x, title_y, title_w, title_h);
    
    float bot_line_x = 0;
    float bot_line_w = viewW;
    float bot_line_h = 1;
    float bot_line_y = viewH - bot_line_h;
    self.bottomLine.frame = CGRectMake(bot_line_x, bot_line_y, bot_line_w, bot_line_h);
    
}





@end
