//
//  CycleTopWindow.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/21.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleTopWindow.h"
#import "UIView+CycleFrame.h"
#import <UIKit/UIKit.h>
static UIWindow *window_;
@implementation CycleTopWindow



/**初始化窗口*/
+(void)initialize{
    window_ = [[UIWindow alloc]init];
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.backgroundColor = [UIColor redColor];
    window_.windowLevel = UIWindowLevelAlert;
    
    [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(WindowClick)]];
}

/**让window显示*/
+ (void)show{
    window_.hidden = NO;
//    [self WindowClick];
}
/**让window隐藏*/
+ (void)hide{
    window_.hidden = YES;
}


/** 点击window */
+ (void)WindowClick{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [self SearchScrollViewInView:keyWindow];
}

+ (void)SearchScrollViewInView:(UIView *)superview{
    
    
    for (UIScrollView *subview in superview.subviews) {

          // 如果是scrollview, 滚动最顶部
        if ([subview isKindOfClass:[UIScrollView class]]&&subview.cycle_isShowingOnKeyWindow) {
            CGPoint offset = subview.contentOffset;
            offset.y-=subview.contentInset.top;
//            offset.y=64;
            [subview setContentOffset:offset animated:YES];
        }
         // 继续查找子控件
        [self SearchScrollViewInView:subview];
    }
    
    
    
    
    
    
    
}


@end
