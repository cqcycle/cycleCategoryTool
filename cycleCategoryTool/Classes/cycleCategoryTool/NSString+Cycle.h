//
//  NSString+Cycle.h
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/6/12.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Cycle)

/**
 *  1.1 判断输入的字符串是否全是中文
 */
-(BOOL)cycle_isAllChinese;
/**
 * 1.2 判断输入的字符串是否有中文
 */
- (BOOL)cycle_isContainChinese;


/**
 *  2.生成随机字符串
 *
 *  @param kNumber 订单号的长度  trade_no：
 */
- (NSString *)cycle_generateRomNumWithNumber: (NSInteger)kNumber;

/**
 *  3.电话号码中间四位用 “*”号表示
 *
 *  @param phoneNumber 电话号码
 *  @param sign 用“*”或者别的符号来占位
 *  @param blank 是否需要 “*” 与前后数字有空格
 */
+ (NSString *)cycle_getPhoneNumber:(NSString *)phoneNumber withSign:(NSString *)sign haveBlank:(BOOL)blank;
/**
 *  3.1 处理手机号码
 */
+ (NSString *)cycle_dealWithPhoneNumber:(NSString *)phoneNum;
/**
 *  4.去掉空格
 * @param str 传入一个字符串
 */
+ (NSString *)cycle_trimWithStr:(NSString *)str;
/**
 *  5.返回当前时间的字符串
 *  @param formatter 时间格式
 */
+ (NSString *)cycle_returnNowDateStrWithFormatter:(NSString *)formatter;
/**
 *  6.返回当前时间的字符串
 *  @param date 某个时间
 *  @param formatter 时间格式
 */
+ (NSString *)cycle_returnNowDate:(NSDate *)date Formatter:(NSString *)formatter;
///6.1 字符串转换为日期
+ (NSDate *)cycle_dateFromString:(NSString *)timeStr andFormatter:(NSString *)formatter;

///6.2 日期转换为字符串
+ (NSString *)cycle_stringFromDate:(NSDate *)date andFormatter:(NSString *)formatter;
///** 时间戳处理 比如：str = @"1823492349394"*/
///6.3 字符串转换为日期
+ (NSString *)cycle_dateFromStringCuo:(NSString *)timeStr andFormatter:(NSString *)formatter;

/**
 * 7.0 一个字符串
 */
+ (NSAttributedString *)cycle_attrStr0:(NSString *)str1 andStr0Color:(UIColor *)str1Color;
/**
 *  7.1 修改某些字的颜色
 *  @param str1 内容一
 *  @param str1Color 内容一颜色
 *  @param str2 内容二
 * @param str2Color 内容二颜色
 */
+ (NSAttributedString *)cycle_attrStr1:(NSString *)str1 andStr1Color:(UIColor *)str1Color andStr2:(NSString *)str2 andStr2Color:(UIColor *)str2Color;
/**
 *  7.2 修改某些字的颜色（3个字符串，修改中间部分）
 *  @param str1 内容一
 *  @param str1Color 内容一颜色
 *  @param str2 内容二
 *。@param str2Color 内容二颜色
 *  @param str3 内容三
 *。@param str3Color 内容三颜色
 */
+ (NSAttributedString *)cycle_attrStr1:(NSString *)str1 andStr1Color:(UIColor *)str1Color andStr2:(NSString *)str2 andStr2Color:(UIColor *)str2Color andStr3:(NSString *)str3 andStr3Color:(UIColor *)str3Color;


@end
