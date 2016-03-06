//
//  GHWTabbarBtn.m
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import "GMTabbarBtn.h"
@interface GMTabbarBtn()
@property(nonatomic,strong)UIImageView* backgImgView;
@property(nonatomic,strong)UILabel* btnTitleLable;
@end
@implementation GMTabbarBtn
@synthesize imgHighlight = _imgHighlight;
@synthesize imgNormal = _imgNormal;
@synthesize isSelected = _isSelected;
@synthesize backgImgSize = _backgImgSize;
@synthesize backgMutable = _backgMutable;
@synthesize btnTitleHightlight = _btnTitleHightlight;
@synthesize btnTitleNormal = _btnTitleNormal;
@synthesize btnTitle = _btnTitle;
@synthesize space = _space;
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        self.layer.borderWidth = 1;
//        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.backgImgView = [[UIImageView alloc]init];
        self.btnTitleHightlight = [UIColor greenColor];
        self.btnTitleNormal = [UIColor lightGrayColor];
        [self addSubview:self.backgImgView];
        self.btnTitleLable = [[UILabel alloc]init];
        [self.btnTitleLable setTextAlignment:NSTextAlignmentCenter];
        [self.btnTitleLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
        [self.btnTitleLable setAdjustsFontSizeToFitWidth:YES];
        [self.btnTitleLable setTextColor:self.btnTitleNormal];
        [self addSubview:self.btnTitleLable];
        _space = 3;
        
//        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)click{
    _isSelected = !_isSelected;
    [self setIsSelected:_isSelected];
}

-(BOOL)isSelected{
    return _isSelected;
}

-(void)setIsSelected:(BOOL)isSelected{
    if (_isSelected != isSelected) {
        _isSelected = isSelected;
        [self setNeedsLayout];
    }
}

-(UIImage *)imgNormal{
    return _imgNormal;
}

-(void)setImgNormal:(UIImage *)imgNormal{
    if (![_imgNormal isEqual:imgNormal]) {
        _imgNormal = imgNormal;
    }
}

-(UIImage *)imgHighlight{
    return _imgHighlight;
}

-(void)setImgHighlight:(UIImage *)imgHighlight{
    if (![_imgHighlight isEqual:imgHighlight]) {
        _imgHighlight = imgHighlight;
    }
}

-(CGSize)backgImgSize{
    return _backgImgSize;
}

-(void)setBackgImgSize:(CGSize)backgImgSize{
    if (!(_backgImgSize.height==backgImgSize.height&&_backgImgSize.width==backgImgSize.width)) {
        _backgImgSize = backgImgSize;
    }
}

-(UIColor *)btnTitleNormal{
    return _btnTitleNormal;
}

-(void)setBtnTitleNormal:(UIColor *)btnTitleNormal{
    if (![_btnTitleNormal isEqual:btnTitleNormal]) {
        _btnTitleNormal = btnTitleNormal;
    }
}


-(UIColor *)btnTitleHightlight{
    return _btnTitleHightlight;
}

-(void)setBtnTitleHightlight:(UIColor *)btnTitleHightlight{
    if (![_btnTitleHightlight isEqual:btnTitleHightlight]) {
        _btnTitleHightlight = btnTitleHightlight;
    }
}

-(NSString *)btnTitle{
    return _btnTitle;
}

-(void)setBtnTitle:(NSString *)btnTitle{
    if (![_btnTitle isEqualToString:btnTitle]) {
        _btnTitle = btnTitle;
        [_btnTitleLable setText:btnTitle];
    }
}

-(float)space{
    return _space;
}

-(void)setSpace:(float)space{
    if (space) {
        _space = space;
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    float viewW = self.bounds.size.width;
    float viewH = self.bounds.size.height;
    
    float btn_t_h = viewH/3;
    float btn_t_x = 0;
    float btn_t_y = viewH - _space - btn_t_h;
    float btn_t_w = viewW;
    
    float imgFrameH = viewH - _space  -_space;
    if (_btnTitle&&![_btnTitle isEqualToString:@""]) {
        imgFrameH = imgFrameH - btn_t_h - _space;
        self.btnTitleLable.frame = CGRectMake(btn_t_x, btn_t_y, btn_t_w, btn_t_h);
    }
    
    float img_x;
    float img_y;
    float img_w;
    float img_h;
    if (self.backgImgSize.height==0&&self.backgImgSize.width==0) {
        img_h = imgFrameH;
        img_w = img_h;
        img_x = (viewW - img_w)/2;
        img_y = _space;
    }else{
        img_w = self.backgImgSize.width;
        img_h = self.backgImgSize.height;
        img_x = (viewW - img_w)/2;
        img_y = (imgFrameH - img_h)/2;
    }
    
    
    self.backgImgView.frame = CGRectMake(img_x, img_y, img_w, img_h);

    if (_backgMutable) {
        if (_isSelected) {
            [self.backgImgView setImage:_imgHighlight];
            [self.btnTitleLable setTextColor:_btnTitleHightlight];
        }else{
            [self.backgImgView setImage:_imgNormal];
            [self.btnTitleLable setTextColor:_btnTitleNormal];
        }
        
    }else{
        [self.backgImgView setImage:_imgNormal];
        [self.btnTitleLable setTextColor:_btnTitleNormal];
    }
}



@end
