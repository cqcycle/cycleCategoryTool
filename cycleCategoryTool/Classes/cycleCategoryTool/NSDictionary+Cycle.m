//
//  NSDictionary+Cycle.m
//  MyCycleTool
//
//  Created by ddy on 2018/1/29.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import "NSDictionary+Cycle.h"

@implementation NSDictionary (Cycle)
/**
 *  1.传入json文件或者plist文件返回字典，如（red.json）
 */
+ (NSDictionary *)cycle_getDictFromJsonFileName:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:nil];
    return dict;
}
@end
