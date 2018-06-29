//
//  UIImageView+CycleUIImageView.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/25.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "UIImageView+CycleUIImageView.h"

@implementation UIImageView (CycleUIImageView)
/**
 * 1.传一个头像的URL，帮你变成圆形
 * @param urlStr :头像的url
 * @param placeHolderImage : 占位图片
 */
- (void)cycle_SetCircleImageWithUrlStr:(NSString *)urlStr andPlaceHolderImage:(NSString *)placeHolderImage{
    
//    UIImage *placeHolder = [UIImage cycle_imageWithOriginalName:placeHolderImage];
//    
//    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeHolder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        self.image = image ? [image cycle_circleImage]: placeHolder;
//    }];
    
    
}

/**
 * 2.传一个头像的URL，帮你变成微圆的方形
 * @param urlStr :头像的url
 * @param placeHolderImage : 占位图片
 * @param coreRadius : 边角大小
 */
- (void)cycle_SetSquareImageWithUrlStr:(NSString *)urlStr andPlaceHolderImage:(NSString *)placeHolderImage andRoundCoreRadius:(CGFloat)coreRadius{
    //占位图
//    UIImage *placeHolder = [UIImage cycle_imageWithOriginalName:placeHolderImage];
//    //显示图片
//    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:placeHolderImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        self.image = image ? [image cycle_SquareImageWithCornerRadius:coreRadius] : placeHolder;
//    }];
}
@end
