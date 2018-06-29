//
//  NSString+CyclefileSize.m
//  CDSBZX
//
//  Created by dihuijun on 17/7/20.
//  Copyright © 2017年 dihuijun. All rights reserved.
//  计算文件大小（MB）

#import "NSString+CyclefileSize.h"
#import <UIKit/UIKit.h>
static CGFloat const BFine = 1000.0;

@implementation NSString (CyclefileSize)


#pragma mark --------  1. MB单位
/**计算某个文件所占内存大小(方法一)，单位 MB*/
- (float)cycle_fileSize_MB1{
    //总大小
    float size = 0;
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //是否是文件夹
    BOOL isDirectory = NO;
    
    BOOL exits = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    //文件夹不存在
    if (!exits)return size;
    
    //是文件夹
    if (isDirectory) {
        
        NSDirectoryEnumerator *enumators = [manager enumeratorAtPath:self];
        for (NSString *path in enumators) {
            //全路径
            NSString *fullPath = [self stringByAppendingPathComponent:path];
            //得到大小
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else{
        //是文件，如：logo.png
        size = [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    return size/BFine/BFine;
}




/**计算某个文件所占内存大小  (方法二)，单位 MB*/
- (float)cycle_fileSize_MB2{
    //总大小
    float size = 0.0;
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //文件属性
    NSDictionary *attrs = [manager attributesOfItemAtPath:self error:nil];
    //判断是否为文件夹
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {
        NSDirectoryEnumerator *subPaths = [manager enumeratorAtPath:self];
        for (NSString *subPath in subPaths) {
            //全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            //累加文件大小
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else{
        //文件
        size = attrs.fileSize;
    }
    
    
    return size/BFine/BFine;
}

#pragma mark --------  2. B单位

/**计算某个文件所占内存大小(方法一)，单位 B*/
- (float)cycle_fileSize_B1{
    //总大小
    float size = 0;
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //是否是文件夹
    BOOL isDirectory = NO;
    
    BOOL exits = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    //文件夹不存在
    if (!exits)return size;
    
    //是文件夹
    if (isDirectory) {
        
        NSDirectoryEnumerator *enumator = [manager enumeratorAtPath:self];
        for (NSString *path in enumator) {
            //全路径
            NSString *fullPath = [self stringByAppendingPathComponent:path];
            //得到大小
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else{
        //是文件，如：logo.png
        size = [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
    return size;
}




/**计算某个文件所占内存大小  (方法二)，单位 MB*/
- (float)cycle_fileSize_B2{
    //总大小
    float size = 0.0;
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //文件属性
    NSDictionary *attrs = [manager attributesOfItemAtPath:self error:nil];
    //判断是否为文件夹
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {
        NSDirectoryEnumerator *subPaths = [manager enumeratorAtPath:self];
        for (NSString *subPath in subPaths) {
            //全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            //累加文件大小
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else{
        //文件
        size = attrs.fileSize;
    }
    
    
    return size;
}
@end
