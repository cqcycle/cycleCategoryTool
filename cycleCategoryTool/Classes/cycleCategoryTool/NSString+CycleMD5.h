//
//  NSString+CycleMD5.h
//
//  Created by Sean Nieuwoudt on 2013/07/19.
//  Copyright (c) 2013 Perk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (CycleMD5)
/**
 * 1.大写的加密
 */
- (NSString *)cycle_MD5FromString:(NSString *)string;
/**
 * 2.小写的加密
 */
- (NSString *)cycle_smallMD5FromString:(NSString *)string;

@end
