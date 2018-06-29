//
//  UIBarButtonItem+CycleItem.h
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CycleItem)

/**方法1.设置导航栏按钮***/
+ (UIBarButtonItem *)cycle_barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


/**方法2.设置导航栏按钮***/
+(UIBarButtonItem *)cycle_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;


/**方法3.设置导航栏按钮***/
+(UIBarButtonItem *)cycle_itemWithTarget:(id)target action:(SEL)action title:(NSString *)title ;

/**方法4.设置导航栏按钮*/
+(UIBarButtonItem *)cycle_itenWithTarget:(id)target action:(SEL)action ControlEvents:(UIControlEvents)controlEvents fontSize:(CGFloat)fontSize WeightFont:(CGFloat)weight btnTextAlignment:(NSTextAlignment)textAlignMent normalTitle:(NSString *)normalTitle normalTitleColor:(UIColor *)normalColor RectFrame:(CGRect)rectFrame TitleEdgeInsets:(UIEdgeInsets)edgeInsets;


/**方法5.设置导航栏按钮*/
+(UIBarButtonItem *)cycle_itenWithTarget:(id)target action:(SEL)action andNormalImg:(NSString *)normalImgName andHightedImg:(NSString *)hightedImgName  RectFrame:(CGRect)rectFrame andImageEdgeInsets:(UIEdgeInsets)edgeInsets;


@end
