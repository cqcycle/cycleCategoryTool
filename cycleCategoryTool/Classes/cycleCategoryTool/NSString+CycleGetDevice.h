//
//  NSString+CycleGetDevice.h
//  BBP
//
//  Created by zczhao on 16/4/15.
//  Copyright © 2016年 TangYunfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CycleGetDevice)
///1.获取硬件设备型号(eg: iPhone 5S)
+ (NSString *)cycle_getDeviceModelName;
///2.1 获取App名称 (eg: me)
+ (NSString *)cycle_getAppName;
///2.2 app版本 (eg: 1.0)
+ (NSString *)cycle_getAppVersion;
///3.获取手机序列号（UUID）
+ (NSString *)cycle_getUuid;
///4.手机系统版本(eg:9.2)
+ (NSString *)cycle_getPhoneVersion;
///5.设备名称(eg:iPhone OS)
+ (NSString *)cycle_getDeviceName;
///6.手机型号(eg:iPhone)
+ (NSString *)cycle_getDeviceModel;
///7.地方型号  （国际化区域名称）(eg:iPhone)
+ (NSString *)cycle_getLocalPhoneModel;







@end
