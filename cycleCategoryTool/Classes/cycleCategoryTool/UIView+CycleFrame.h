//
//  UIView+CycleFrame.h
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CycleFrame)
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
@property (nonatomic, assign) CGFloat c_x;
@property (nonatomic, assign) CGFloat c_y;
@property (nonatomic, assign) CGFloat c_centerX;
@property (nonatomic, assign) CGFloat c_centerY;
@property (nonatomic, assign) CGFloat c_width;
@property (nonatomic, assign) CGFloat c_height;
@property (nonatomic, assign) CGSize c_size;
@property (nonatomic, assign) CGPoint c_origin;
@property (nonatomic, assign) CGFloat c_right;
@property (nonatomic, assign) CGFloat c_bottom;
/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)cycle_isShowingOnKeyWindow;
/**
 * 加载xib
 */
+ (instancetype)cycle_viewForNib;

/**
 * 返回到指定控制器
 */
- (void)cycle_returnToPointViewController:(UIViewController *)pointVc andNavgationController:(UINavigationController *)navControl;
@end
