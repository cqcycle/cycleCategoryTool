//
//  NSString+Cycle.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/6/12.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "NSString+Cycle.h"
#import <UIKit/UIKit.h>
@implementation NSString (Cycle)

/**
 *  1.1 判断输入的字符串是否全是中文
 */
-(BOOL)cycle_isAllChinese{
    NSInteger count = self.length;
    NSInteger result = 0;
    for (int i = 0; i < count; i++) {
        int a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {//判断输入的是否是中文
            result++;
        }
    }
    
    if (count == result) {
        return YES;
    }
    return NO;
}
/**
 * 1.2 判断输入的字符串是否有中文
 */
- (BOOL)cycle_isContainChinese{
    
    for (int i = 0; i < self.length; i++) {
        int a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {//判断输入的是否是中文
            return YES;
        }
    }
    return NO;
}
///**
// *  2.1 是否是中文
// */
//-(BOOL)isChinese{
//    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
//    return [predicate evaluateWithObject:self];
//}

/**
 *  2.生成随机字符串
 *
 *  @param kNumber 订单号的长度  trade_no：
 */
- (NSString *)cycle_generateRomNumWithNumber: (NSInteger)kNumber
{
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned int)time(0));
    for (NSInteger i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
/**
 *  3.电话号码中间四位用 “*”号表示
 *
 *  @param phoneNumber 电话号码
 *  @param sign 用“*”或者别的符号来占位
 *  @param blank 是否需要 “*” 与前后数字有空格
 */
+ (NSString *)cycle_getPhoneNumber:(NSString *)phoneNumber withSign:(NSString *)sign haveBlank:(BOOL)blank{
    //去掉“-”
    phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    //去掉 “+86 ”相关字眼
    if ([phoneNumber hasPrefix:@"+"]) {
        NSString *cut = @"+86 ";
        NSString *cutStr = [phoneNumber substringToIndex:cut.length];
        phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:cutStr withString:@""];
        
    }

    //去掉空格
    sign = [sign stringByReplacingOccurrencesOfString:@" " withString:@""];
    char i = [sign characterAtIndex:0];
    if (blank) {
            sign = [NSString stringWithFormat:@" %c%c%c%c ",i,i,i,i];

    }else{
            sign = [NSString stringWithFormat:@"%c%c%c%c",i,i,i,i];
    }
    ///电话号码
    NSString *originTel = phoneNumber;
    NSString *tel = [originTel stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:sign];
    return tel;
}
/**
 *  3.1 处理手机号码
 */
+ (NSString *)cycle_dealWithPhoneNumber:(NSString *)phoneNum{
    phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    if ([phoneNum hasPrefix:@"+"]) {
        NSString *cut = @"+86 ";
        NSString *cutStr = [phoneNum substringToIndex:cut.length];
        phoneNum = [phoneNum stringByReplacingOccurrencesOfString:cutStr withString:@""];
        
    }
    phoneNum = [NSString cycle_trimWithStr:phoneNum];
    return phoneNum;
}
/**
 *  4.去掉空格
 * @param str 传入一个字符串
 */
+ (NSString *)cycle_trimWithStr:(NSString *)str{
//    if (!str.length)return;
    NSString *result = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
    return result;
}
/**
 *  5.返回当前时间的字符串
 *  @param formatter 时间格式
 */
+ (NSString *)cycle_returnNowDateStrWithFormatter:(NSString *)formatter{
    NSDate *Nowdate = [NSDate date];
    NSDateFormatter *sdf = [[NSDateFormatter alloc]init];
    [sdf setDateFormat:formatter];
    NSString *nowDateStr = [sdf stringFromDate:Nowdate];
    
    return nowDateStr;
}
/**
 *  6.返回当前时间的字符串
 *  @param date 某个时间
 *  @param formatter 时间格式
 */
+ (NSString *)cycle_returnNowDate:(NSDate *)date Formatter:(NSString *)formatter{
    NSDateFormatter *sdf = [[NSDateFormatter alloc]init];
    [sdf setDateFormat:formatter];
    NSString *nowDateStr = [sdf stringFromDate:date];
    return nowDateStr;
}

///6.1 字符串转换为日期
+ (NSDate *)cycle_dateFromString:(NSString *)timeStr andFormatter:(NSString *)formatter{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:formatter];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date =[dateFormat dateFromString:timeStr];
    
    return date;

}

///6.2 日期转换为字符串
+ (NSString *)cycle_stringFromDate:(NSDate *)date andFormatter:(NSString *)formatter{
    
    　　NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:formatter];//设定时间格式,这里可以设置成自己需要的格式
    
    　　
    NSString *currentDateStr = [dateFormat stringFromDate:date];
    
    
    return currentDateStr;
}
///** 时间戳处理 比如：str = @"1823492349394"*/
///6.3 字符串转换为日期
+ (NSString *)cycle_dateFromStringCuo:(NSString *)timeStr andFormatter:(NSString *)formatter{
    // timeStampString 是服务器返回的13位时间戳
    NSString *timeStampString  = timeStr;
    
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *sdf = [[NSDateFormatter alloc] init];
    [sdf setDateFormat:formatter];
    NSString *dateString       = [sdf stringFromDate: date];
    NSLog(@"服务器返回的时间戳对应的时间是:%@",dateString);
    return dateString;
}
/**
 * 7.0 一个字符串
 */
+ (NSAttributedString *)cycle_attrStr0:(NSString *)str1 andStr0Color:(UIColor *)str1Color{
    NSMutableAttributedString *attres = [[NSMutableAttributedString alloc]initWithString:str1];
    [attres addAttributes:@{NSForegroundColorAttributeName : str1Color} range:NSMakeRange(0, str1.length)];
    
    return attres;
}
/**
 *  7.1 修改某些字的颜色（2个字符串）
 *  @param str1 内容一
 *  @param str1Color 内容一颜色
 *  @param str2 内容二
 *。@param str2Color 内容二颜色
 */
+ (NSAttributedString *)cycle_attrStr1:(NSString *)str1 andStr1Color:(UIColor *)str1Color andStr2:(NSString *)str2 andStr2Color:(UIColor *)str2Color{
    NSMutableAttributedString *attres = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",str1,str2]];
    [attres addAttributes:@{NSForegroundColorAttributeName : str1Color} range:NSMakeRange(0, str1.length)];
    [attres addAttributes:@{NSForegroundColorAttributeName : str2Color} range:NSMakeRange(str1.length, str2.length)];
    return attres;
}
/**
 *  7.2 修改某些字的颜色（3个字符串，修改中间部分）
 *  @param str1 内容一
 *  @param str1Color 内容一颜色
 *  @param str2 内容二
 *。@param str2Color 内容二颜色
 *  @param str3 内容三
 *。@param str3Color 内容三颜色
 */
+ (NSAttributedString *)cycle_attrStr1:(NSString *)str1 andStr1Color:(UIColor *)str1Color andStr2:(NSString *)str2 andStr2Color:(UIColor *)str2Color andStr3:(NSString *)str3 andStr3Color:(UIColor *)str3Color{
    
    NSMutableAttributedString *attres = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@%@",str1,str2,str3]];
    [attres addAttributes:@{NSForegroundColorAttributeName : str1Color} range:NSMakeRange(0, str1.length)];
    [attres addAttributes:@{NSForegroundColorAttributeName : str2Color} range:NSMakeRange(str1.length, str2.length)];
    [attres addAttributes:@{NSForegroundColorAttributeName : str3Color} range:NSMakeRange((str1.length+str2.length), str3.length)];
    return attres;
}


@end
