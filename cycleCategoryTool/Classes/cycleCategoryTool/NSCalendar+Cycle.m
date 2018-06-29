//
//  NSCalendar+Cycle.m
//  MyCycleTool
//
//  Created by dihuijun on 17/8/15.
//  Copyright © 2017年 Cycle. All rights reserved.
//

#import "NSCalendar+Cycle.h"
#import <UIKit/UIKit.h>
@implementation NSCalendar (Cycle)
/** 初始化Canlendar */
+ (instancetype)cycle_calendar{
    NSCalendar *calendar = nil;
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >=8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else{
        calendar = [NSCalendar currentCalendar];
    }
    return calendar;
}
@end
