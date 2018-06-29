//
//  UIView+CycleLayer.h
//  JCJD
//
//  Created by zl on 2017/12/1.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CycleLayer)
///设置圆角
- (void)cycle_setLayerCornerRadius:(CGFloat)radius;
///设置圆角边框
- (void)cycle_setLayerCornerRadius:(CGFloat)radius andBorderWidth:(CGFloat)width andBorderColor:(UIColor *)borderColor;
/**
 * 设置阴影
 *
 * @param color 阴影的颜色
 * @param size  阴影的偏移量
 * @param opacity 阴影的透明度
 */
- (void)cycle_setShadowColor:(UIColor *)color andShadowOffset:(CGSize)size andShadowOpacity:(CGFloat)opacity;

@end
