//
//  UIColor+CycleHexColors.h
//  MZB
//
//  Created by 吴文拼 on 2017/10/31.
//  Copyright © 2017年 吴文拼. All rights reserved.
//  颜色之间的转换

#import <UIKit/UIKit.h>

@interface UIColor (CycleHexColors)
/**
 * 1.颜色字符串转成颜色
 */
+ (UIColor *)cycle_colorwithHexString:(NSString *)color;
/**
 * 2.颜色转成颜色字符串
 */
+(NSString *)cycle_hexValuesFromUIColor:(UIColor *)color;

@end
