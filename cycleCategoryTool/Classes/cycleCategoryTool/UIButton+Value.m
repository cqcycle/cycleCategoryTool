//
//  UIButton+Value.m
//  sdas
//
//  Created by ddy on 2018/6/29.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import "UIButton+Value.h"
#import "UIImage+CycleImage.h"
@implementation UIButton (Value)


/**
 *  设置拉伸后的正常和高亮状态的按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */
-(void)cycle_setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg{
    [self cycle_setResizedNormalBg:normalBg];
    [self cycle_setResizedHighlightedBg:highlightedBg];
}


/**
 *  设置未拉伸后的正常和高亮状态按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlighted 高亮状态的背影图片
 */
-(void)cycle_setNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg{
    [self cycle_setNormalBg:normalBg];
    [self cycle_setHighlightedBg:highlightedBg];
}
-(void)cycle_setNBg:(NSString *)nBg hBg:(NSString *)hBg{
    [self cycle_setNBg:nBg];
    [self cycle_setHBg:hBg];
}

/**
 *  设置未拉伸的正常状态背影图片
 */
-(void)cycle_setNormalBg:(NSString *)normalBg{
    
    [self setBackgroundImage:[UIImage imageNamed:normalBg] forState:UIControlStateNormal];
}
-(void)cycle_setNBg:(NSString *)nBg{
    [self setBackgroundImage:[UIImage imageNamed:nBg] forState:UIControlStateNormal];
}

/**
 *  设置未拉伸的高亮状态背影图片
 */
-(void)cycle_setHighlightedBg:(NSString *)highlightedBg{
    [self setBackgroundImage:[UIImage imageNamed:highlightedBg] forState:UIControlStateHighlighted];
}
-(void)cycle_setHBg:(NSString *)hBg{
    [self setBackgroundImage:[UIImage imageNamed:hBg] forState:UIControlStateHighlighted];
}

/**
 *  设置拉伸后的正常状态背影图片
 */
-(void)cycle_setResizedNormalBg:(NSString *)normalBg{
    [self setBackgroundImage:[UIImage cycle_resizedImageWithName:normalBg] forState:UIControlStateNormal];
}


/**
 *  设置拉伸后的高亮状态背影图片
 *
 */
-(void)cycle_setResizedHighlightedBg:(NSString *)highlightedBg{
    [self setBackgroundImage:[UIImage cycle_resizedImageWithName:highlightedBg] forState:UIControlStateHighlighted];
}


/**
 *  设置未拉伸的选中状态背影图片
 */
-(void)cycle_setSelectedBg:(NSString *)selectedBg{
    [self setBackgroundImage:[UIImage imageNamed:selectedBg] forState:UIControlStateSelected];
}

/**
 *  设置拉伸后的选中状态背影图片
 */
-(void)cycle_setResizedSelectedBg:(NSString *)selectedBg{
    [self setBackgroundImage:[UIImage cycle_resizedImageWithName:selectedBg] forState:UIControlStateSelected];
}

/**
 *  设置未拉伸的正常状态的Image
 */
-(void)cycle_setNormalImage:(NSString *)normalImage{
    [self setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
}

/**
 *  设置未拉伸的高亮状态的Image
 */
-(void)cycle_setHighlightedImage:(NSString *)highlightedImage{
    [self setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
}

/**
 *  设置未拉伸的普通和高亮状态的Image
 */

-(void)cycle_setNormalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage{
    [self cycle_setNormalImage:normalImage];
    [self cycle_setHighlightedImage:highlightedImage];
}
/**
 *  普通状态下的title
 */

-(void)cycle_setNormalTitle:(NSString *)normalTitle{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}
/**
 *  普通状态下的titleColor
 */
-(void)cycle_setNormalTitleColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateNormal];
}
/**
 *  高亮状态下的title
 */
-(void)cycle_setHighLightedTitle:(NSString *)HightLightTitle{
    [self setTitle:HightLightTitle forState:UIControlStateHighlighted];
}

/**
 *  高亮状态下的titleColor
 */
-(void)cycle_setHighLightedTitleColor:(UIColor *)color{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}


/** 点击按钮获取验证码 */
- (void)cycle_startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle
{
    __block NSInteger timeOut = timeout;//倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行
    
    
    
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0)
        {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:title forState:UIControlStateNormal];
                
                self.userInteractionEnabled = YES;
            });
        }
        else
        {
            //int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@", strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@", strTime, waitTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}
/** 点击按钮获取验证码：背景色 */
- (void)cycle_startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle andGetStatusBgColor:(UIColor *)getStatusBgColor andNormalbgColor:(UIColor *)normalColor
{
    __block NSInteger timeOut = timeout;//倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行
    
    
    
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0)
        {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:title forState:UIControlStateNormal];
                [self setBackgroundColor:getStatusBgColor];
                self.userInteractionEnabled = YES;
            });
        }
        else
        {
            //int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@", strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@", strTime, waitTitle] forState:UIControlStateNormal];
                [self setBackgroundColor:normalColor];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}


@end
