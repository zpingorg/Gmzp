//
//  GHWTabbarBtn.h
//  GMKP
//
//  Created by Wuyixin on 16/3/5.
//  Copyright © 2016年 Game Hollywood. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GMContentView;
@interface GMTabbarBtn : UIButton
@property(nonatomic,weak)GMContentView* contentView;
@property(nonatomic,strong)UIImage* imgHighlight;
@property(nonatomic,strong)UIImage* imgNormal;

@property(nonatomic,strong)NSString* btnTitle;
@property(nonatomic,strong)UIColor* btnTitleHightlight;
@property(nonatomic,strong)UIColor* btnTitleNormal;
@property(nonatomic)BOOL isSelected;
@property(nonatomic)BOOL backgMutable;
@property(nonatomic)CGSize backgImgSize;//背景图标大小
@property(nonatomic)float space;//背景图标以及标题的上下边距
-(void)click;
@end
