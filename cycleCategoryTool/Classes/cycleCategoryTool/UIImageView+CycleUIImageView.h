//
//  UIImageView+CycleUIImageView.h
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/25.
//  Copyright © 2016年 Cycle. All rights reserved.
//  设置头像

#import <UIKit/UIKit.h>

@interface UIImageView (CycleUIImageView)
/**
 *  1.传一个头像的URL，帮你变成圆形
 *  @param urlStr :头像的url
 *  @param placeHolderImage : 占位图片
 */
- (void)cycle_SetCircleImageWithUrlStr:(NSString *)urlStr andPlaceHolderImage:(NSString *)placeHolderImage;

/**
 * 2.传一个头像的URL，帮你变成微圆的方形
 * @param urlStr :头像的url
 * @param placeHolderImage : 占位图片
 * @param coreRadius : 边角大小
 */
- (void)cycle_SetSquareImageWithUrlStr:(NSString *)urlStr andPlaceHolderImage:(NSString *)placeHolderImage andRoundCoreRadius:(CGFloat)coreRadius;
@end
