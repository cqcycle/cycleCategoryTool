//
//  UIButton+Value.h
//  sdas
//
//  Created by ddy on 2018/6/29.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ActionBlock)(UIButton *btn);
@interface UIButton (Value)

/**
 *  设置拉伸后的正常和高亮状态的按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlightedBg 高亮状态的背影图片
 */
-(void)cycle_setResizedNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg;
/**
 *  设置未拉伸后的正常和高亮状态按钮背影图片
 *
 *  @param normalBg    普通状态的背影图片
 *  @param highlightedBg 高亮状态的背影图片
 */
-(void)cycle_setNormalBg:(NSString *)normalBg highlightedBg:(NSString *)highlightedBg;
-(void)cycle_setNBg:(NSString *)nBg hBg:(NSString *)hBg;

/**
 *  设置未拉伸的正常状态背影图片
 */
-(void)cycle_setNormalBg:(NSString *)normalBg;
-(void)cycle_setNBg:(NSString *)nBg;

/**
 *  设置未拉伸的高亮状态背影图片
 */
-(void)cycle_setHighlightedBg:(NSString *)highlightedBg;
-(void)cycle_setHBg:(NSString *)hBg;


/**
 *  设置拉伸后的正常状态背影图片
 */
-(void)cycle_setResizedNormalBg:(NSString *)normalBg;

/**
 *  设置拉伸后的高亮状态背影图片
 *
 */
-(void)cycle_setResizedHighlightedBg:(NSString *)highlightedBg;


/**
 *  设置未拉伸的选中状态背影图片
 */
-(void)cycle_setSelectedBg:(NSString *)selectedBg;

/**
 *  设置拉伸的选中状态背影图片
 */
-(void)cycle_setResizedSelectedBg:(NSString *)selectedBg;

/**
 *  设置未拉伸的正常状态的Image
 */
-(void)cycle_setNormalImage:(NSString *)normalImage;


/**
 *  设置未拉伸的高亮状态的Image
 */
-(void)cycle_setHighlightedImage:(NSString *)highlightedImage;

/**
 *  设置未拉伸的普通和高亮状态的Image
 */

-(void)cycle_setNormalImage:(NSString *)normalImage highlightedImage:(NSString *)highlightedImage;


/**
 *  普通状态下的title
 */
-(void)cycle_setNormalTitle:(NSString *)normalTitle;

/**
 *  普通状态下的titleColor
 */
-(void)cycle_setNormalTitleColor:(UIColor *)color;
/**
 *  高亮状态下的title
 */
-(void)cycle_setHighLightedTitle:(NSString *)HightLightTitle;

/**
 *  高亮状态下的titleColor
 */
-(void)cycle_setHighLightedTitleColor:(UIColor *)color;

/**
 *  点击按钮获取验证码
 */
- (void)cycle_startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle;
/**
 *  点击按钮获取验证码：背景色
 */
- (void)cycle_startTime:(NSInteger)timeout title:(NSString *)title waitTitle:(NSString *)waitTitle andGetStatusBgColor:(UIColor *)getStatusBgColor andNormalbgColor:(UIColor *)normalColor;

@end
