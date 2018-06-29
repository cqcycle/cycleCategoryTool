//
//  NSString+CyclefileSize.h
//  CDSBZX
//
//  Created by dihuijun on 17/7/20.
//  Copyright © 2017年 dihuijun. All rights reserved.
//  计算文件大小

#import <Foundation/Foundation.h>

@interface NSString (CyclefileSize)


/**计算某个文件所占内存大小(方法一)，单位 MB*/
- (float)cycle_fileSize_MB1;

/**计算某个文件所占内存大小  (方法二)，单位 MB*/
- (float)cycle_fileSize_MB2;

/************************/
/**计算某个文件所占内存大小(方法一)，单位 B*/
- (float)cycle_fileSize_B1;

/**计算某个文件所占内存大小  (方法二)，单位 B*/
- (float)cycle_fileSize_B2;

/*
 使用方法：
 NSLog(@"%.2f MB",@"/Users/dihuijun/Desktop/KSImageNamed-Xcode-master".cycle_fileSize_MB1);
 */








@end
