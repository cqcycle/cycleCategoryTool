//
//  NSDictionary+Cycle.h
//  MyCycleTool
//
//  Created by ddy on 2018/1/29.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Cycle)
/**
 *  1.传入json文件或者plist文件返回字典，如（red.json）
 */
+ (NSDictionary *)cycle_getDictFromJsonFileName:(NSString *)fileName;
@end
