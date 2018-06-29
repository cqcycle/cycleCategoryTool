//
//  UIBarButtonItem+CycleItem.m
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//

#import "UIBarButtonItem+CycleItem.h"
#import "UIView+CycleFrame.h"
#import "UIButton+Value.h"
@implementation UIBarButtonItem (CycleItem)
/**方法1.设置导航栏按钮***/
+ (UIBarButtonItem *)cycle_barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    // btn
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}
/**方法2.设置导航栏按钮***/

+(UIBarButtonItem *)cycle_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //监听
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //设置 图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    //设置尺寸
    
    if ([image isEqualToString:@"放大镜"]) {
        btn.c_width=20;
        btn.c_height=20;
    }else
    {
        btn.c_size=btn.currentBackgroundImage.size;
    }
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}





/**方法3.设置导航栏按钮***/
+(UIBarButtonItem *)cycle_itemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //监听
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //设置 图片
    [btn setTitle:title  forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal ];
    
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    //设置尺寸
    
    
    btn.c_width=40;
    btn.c_height=20;
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

/**方法四设置导航栏按钮*/
+(UIBarButtonItem *)cycle_itenWithTarget:(id)target action:(SEL)action ControlEvents:(UIControlEvents)controlEvents fontSize:(CGFloat)fontSize WeightFont:(CGFloat)weight btnTextAlignment:(NSTextAlignment)textAlignMent normalTitle:(NSString *)normalTitle normalTitleColor:(UIColor *)normalColor RectFrame:(CGRect)rectFrame TitleEdgeInsets:(UIEdgeInsets)edgeInsets{
    
    
    ///1.左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    ///2.设置普通状态下按钮颜色
    [btn cycle_setNormalTitleColor:normalColor];
    ///3.设置普通状态下 按钮文本
    [btn cycle_setNormalTitle:normalTitle];
    ///4.设置按钮对齐方式
    btn.titleLabel.textAlignment = textAlignMent;
    ///5.设置字体和加粗程度
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize weight:weight];
    ///6.添加事件
    [btn addTarget:target action:action forControlEvents:controlEvents];
    ///7.设置frame
    btn.frame = rectFrame;
    ///8.设置标题偏离程度
    btn.titleEdgeInsets = edgeInsets;
    
    return  [[UIBarButtonItem alloc]initWithCustomView:btn];
}
/**方法五设置导航栏按钮*/
+(UIBarButtonItem *)cycle_itenWithTarget:(id)target action:(SEL)action andNormalImg:(NSString *)normalImgName andHightedImg:(NSString *)hightedImgName  RectFrame:(CGRect)rectFrame andImageEdgeInsets:(UIEdgeInsets)edgeInsets{
    
    
    ///1.左边按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //2.设置图片
    [btn setImage:[UIImage imageNamed:normalImgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightedImgName] forState:UIControlStateHighlighted];
    ///3.添加事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    ///4.设置frame
    btn.frame = rectFrame;
    ///5.设置标题偏离程度
    btn.imageEdgeInsets = edgeInsets;
    
    
    return  [[UIBarButtonItem alloc]initWithCustomView:btn];
}


@end
