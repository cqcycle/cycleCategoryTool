//
//  UIView+CycleFrame.m
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//

#import "UIView+CycleFrame.h"
#import <UIKit/UIKit.h>
@implementation UIView (CycleFrame)

-(void)setC_x:(CGFloat)c_x
{
    CGRect frame = self.frame;
    frame.origin.x = c_x;
    self.frame = frame;
}

- (void)setC_y:(CGFloat)c_y
{
    CGRect frame = self.frame;
    frame.origin.y = c_y;
    self.frame = frame;
}

- (CGFloat)c_x
{
    return self.frame.origin.x;
}

- (CGFloat)c_y
{
    return self.frame.origin.y;
}

- (void)setC_centerX:(CGFloat)c_centerX
{
    CGPoint center = self.center;
    center.x = c_centerX;
    self.center = center;
}

- (CGFloat)c_centerX
{
    return self.center.x;
}

- (void)setC_centerY:(CGFloat)c_centerY
{
    CGPoint center = self.center;
    center.y = c_centerY;
    self.center = center;
}

- (CGFloat)c_centerY
{
    return self.center.y;
}

- (void)setC_width:(CGFloat)c_width
{
    CGRect frame = self.frame;
    frame.size.width = c_width;
    self.frame = frame;
}
- (CGFloat)c_width
{
    return self.frame.size.width;
}
- (void)setC_height:(CGFloat)c_height
{
    CGRect frame = self.frame;
    frame.size.height = c_height;
    self.frame = frame;
}
- (CGFloat)c_height
{
    return self.frame.size.height;
}
- (void)setC_right:(CGFloat)c_right {
    CGRect frame = self.frame;
    frame.origin.x = c_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)c_right
{
    return self.frame.origin.x + self.frame.size.width;
}






- (void)setC_bottom:(CGFloat)c_bottom {
    CGRect frame = self.frame;
    frame.origin.y = c_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)c_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setC_size:(CGSize)c_size
{
    CGRect frame = self.frame;
    frame.size = c_size;
    self.frame = frame;
}
- (CGSize)c_size
{
    return self.frame.size;
}

- (void)setC_origin:(CGPoint)c_origin
{
    CGRect frame = self.frame;
    frame.origin = c_origin;
    self.frame = frame;
}

- (CGPoint)c_origin
{
    return self.frame.origin;
}
/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)cycle_isShowingOnKeyWindow{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect windowBounds = [keyWindow bounds];
    BOOL isShowing = CGRectIntersectsRect(newFrame, windowBounds);
    
    //  (1)!self.isHidden : 该控制器没有被隐藏
    //  (2)self.alpha : 该控制器可见
    //  (3)self.window ：该控制器对应的window等于keyWindow
    //  (4) isShowing :  (newFrame:“由”某块区域的self.frame，原属于self.superview,“转化”到keywindow上的坐标)
    
    return !self.isHidden&&self.alpha>0.01&&self.window==keyWindow&&isShowing;
    
}
/**
 * 加载xib
 */
+ (instancetype)cycle_viewForNib{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

/**
 * 返回到指定控制器
 */
- (void)cycle_returnToPointViewController:(UIViewController *)pointVc andNavgationController:(UINavigationController *)navControl
{
    
    for (UIViewController *temp in navControl.viewControllers) {
        if ([temp isKindOfClass:[pointVc class]]) {
            [navControl popToViewController:temp animated:YES];
        }
    }
    
}
@end
