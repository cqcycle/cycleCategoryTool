//
//  UIView+CycleLayer.m
//  JCJD
//
//  Created by zl on 2017/12/1.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "UIView+CycleLayer.h"

@implementation UIView (CycleLayer)
///设置圆角
- (void)cycle_setLayerCornerRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
///设置圆角边框
- (void)cycle_setLayerCornerRadius:(CGFloat)radius andBorderWidth:(CGFloat)width andBorderColor:(UIColor *)borderColor{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = width;
}
/**
 * 设置阴影
 */
- (void)cycle_setShadowColor:(UIColor *)color andShadowOffset:(CGSize)size andShadowOpacity:(CGFloat)opacity{
    //设置阴影的颜色
    self.layer.shadowColor   = color.CGColor;
    //设置阴影的偏移量，如果为正数，则代表为往右边偏移
    self.layer.shadowOffset  = size;
    //设置阴影的透明度(0~1之间，0表示完全透明)
    self.layer.shadowOpacity = opacity;
}
@end
