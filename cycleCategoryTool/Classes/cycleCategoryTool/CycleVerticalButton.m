//
//  CycleVerticalButton.m
//  BaiSiBuDeQiJie
//
//  Created by hd on 16/6/1.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleVerticalButton.h"
#import "UIView+CycleFrame.h"
@implementation CycleVerticalButton

- (void)setup{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}
/**
 *  为了代码的通用性,写下初始化方法，以后无论是纯代码还是xib都可以调用
 */
-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self layout];
}
///layout
- (void)layout{
    //1. 图片
    self.imageView.c_y = 0;
    self.imageView.c_width = (self.c_width*0.6);
    self.imageView.c_x = (self.c_width-self.c_width*0.6)*0.5;
    self.imageView.c_height = self.imageView.c_width;
    
    
    //2. 文字
    self.titleLabel.c_x = 0;
    self.titleLabel.c_y = CGRectGetMaxY(self.imageView.frame)+10;
    self.titleLabel.c_width = self.c_width;
    self.titleLabel.c_height = self.c_height - self.titleLabel.c_y;
}
@end
