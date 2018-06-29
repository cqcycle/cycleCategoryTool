//
//  CycleSquareButton.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/29.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleSquareButton.h"
#import "UIView+CycleFrame.h"
//#import "UIButton+WebCache.h"
@implementation CycleSquareButton
-(void)awakeFromNib{
    [super awakeFromNib];
    //用了xib
    [self setup];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //用了纯代码
        [self setup];
    }
    return self;
}

//按钮初始化
-(void)setup{
    //文字剧中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //字体
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    //字体颜色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置按钮背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
}

#pragma mark --- 调整间距
-(void)layoutSubviews{
    [super layoutSubviews];
    //图片
    self.imageView.c_y = self.c_height*0.15;
    self.imageView.c_x = self.c_width*0.25;//图片居中
    self.imageView.c_width = self.c_width*0.5;
    self.imageView.c_height = self.imageView.c_width;
    
    //文字
    self.titleLabel.c_x = 0;
    self.titleLabel.c_y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.c_width = self.c_width;
    self.titleLabel.c_height = self.c_height-self.titleLabel.c_y;
    
}




@end
