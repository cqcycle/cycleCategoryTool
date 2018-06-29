//
//  NSDate+Cycle.m
//  ;
//
//  Created by Cycle on 16/4/24.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "NSDate+Cycle.h"
#import "NSCalendar+Cycle.h"
@implementation NSDate (Cycle)
/**比较当前时间nowTime和服务器传过来的Create_Time之间相差的“时分秒”*/
- (NSDateComponents *)daltaForm:(NSDate *)from_Create_time{
    
    
    //日历
    NSCalendar *calender = [NSCalendar cycle_calendar];
    
    //模式
    NSCalendarUnit unit= NSCalendarUnitYear | NSCalendarUnitMonth |
    NSCalendarUnitDay  | NSCalendarUnitHour  |
    NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return  [calender components:unit fromDate:from_Create_time toDate:self options:0];
    
}
/**是否是今年*/
- (BOOL)isThisYear{
    
    //日历
    NSCalendar *calender = [NSCalendar cycle_calendar];
    
    
    //今年
    NSInteger nowYear = [calender component:NSCalendarUnitYear fromDate:[NSDate date]];
    //去年
    NSInteger selfYear=[calender component:NSCalendarUnitYear fromDate:self];
    //如果时间相同则是今年
    return nowYear==selfYear;
}
/**是否是今天*/
- (BOOL)isToday{
    /**
     比较年月日
     */
    //日历
    NSCalendar *calender = [NSCalendar cycle_calendar];
    
    //模式
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    //当前时间下的时间组件
    NSDateComponents *nowcmps=[calender components:unit fromDate:[NSDate date]];
    //服务器传过来的时间对应的时间组件
    NSDateComponents *selfcmps=[calender components:unit fromDate:self];
    
    return (nowcmps.year==selfcmps.year
            &&nowcmps.month==selfcmps.month
            &&nowcmps.day==selfcmps.day);
    
    //
    //或者
    //    NSDateFormatter *sdf=[[NSDateFormatter alloc]init];
    //    sdf.dateFormat=@"yyyy:MM:dd";
    //
    //    NSString *nowDate=[sdf stringFromDate:[NSDate date]];
    //
    //    NSString *selfDate=[sdf stringFromDate:self];
    //    return [nowDate isEqualToString:selfDate];
    
    
}
/**是否是昨天*/
- (BOOL)isYesterday{
    
    //判断是昨天比较当前时间的年月日和服务器传过来的年月日
    NSDateFormatter *sdf=[[NSDateFormatter alloc]init];
    [sdf setDateFormat:@"yyyy-MM-dd"];
    
    //转成只有年月日的时间
    NSDate *now_timeDate=[sdf dateFromString:[sdf stringFromDate:[NSDate date]]];
    NSDate *self_timeDate=[sdf dateFromString:[sdf stringFromDate:self]];
    
    
    //日历
    NSCalendar *calender = [NSCalendar cycle_calendar];
    
    //模式
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calender components:unit fromDate:self_timeDate    toDate:now_timeDate options:0];
    
    
    //当两个时间差： 年没有差距，月没有差距，相差一天就是昨天
    return cmps.year==0
    &&cmps.month==0
    &&cmps.day==1;
    
}

///** 时间戳处理 比如：str = @"1823492349394"*/
- (NSDate *)dateFromTimeStr:(NSString *)str{
    
//    NSDateFormatter *sdf = [[NSDateFormatter alloc]init];
//    sdf.dateFormat = @"EEE MMM yyyy-MM-mm HH:mm:ss";//如果是欧美时间下面的一定要写local
//    sdf.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CH"];
//    sdf.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    
    NSTimeInterval second = str.longLongValue / 1000.0;
    NSDate *date =  [NSDate dateWithTimeIntervalSince1970:second];

    return date;
    
}
@end
