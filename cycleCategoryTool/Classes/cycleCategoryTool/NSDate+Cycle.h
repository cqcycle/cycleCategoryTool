//
//  NSDate+Cycle.h
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/4/24.
//  Copyright © 2016年 Cycle. All rights reserved.
//  时间
/******
 [sdf setDateFormat:@"EEE MMM d HH:mm:ss Z yyyy"];
 // 让时间本地化,让日期格式字符串知道来自哪（EEE MMM d HH:mm:ss Z yyyy）,当发送微博时可以检测到,判断控件是否存在,点击debug
 ***/
#import <Foundation/Foundation.h>

@interface NSDate (Cycle)
/**比较当前时间nowTime和服务器传过来的Create_Time*/
- (NSDateComponents *)daltaForm:(NSDate *)from_Create_time;

/**是否是今年*/
- (BOOL)isThisYear;
/**是否是今天*/
- (BOOL)isToday;
/**是否是昨天*/
- (BOOL)isYesterday;

///** 时间戳处理 比如：str = @"1823492349394" 转成2017-12-10 23:11:11 +0000 正常时间格式*/
- (NSDate *)dateFromTimeStr:(NSString *)str;

@end
