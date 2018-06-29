//
//  UIImage+CycleImage.h
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CycleImage)
// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象
// UIImage *

/**
 * 1.加载最原始的图片，没有渲染
 * @param imageName : 图片名称
 */
+ (instancetype)cycle_imageWithOriginalName:(NSString *)imageName;


/** 
 *  2.未拉伸图片
 *  @param imageName : 图片名称
 */
+ (instancetype)cycle_imageWithStretchableName:(NSString *)imageName;

/** 
 *  3.返回一张自由拉伸的图片
 *  @param name : 图片名称
 */
+ (UIImage *)cycle_resizedImageWithName:(NSString *)name;



/** 4.返回拉伸的图片*/
+ (UIImage *)cycle_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;


/** 5.将图片转成圆形*/
+ (instancetype)cycle_circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;



/** 6.返回主bundle的图片对象 */
+(UIImage *)cycle_imageFromMainBundleWithName:(NSString *)name;




/** 7.图片尺寸*/
- (UIImage*)cycle_imageByScalingAndCroppingForSize:(CGSize)targetSize;



/**
 * 8.1 直接将图片变成圆角
 * 用涂层让图片变成圆形会让程序卡，效率低
 */
- (UIImage *)cycle_circleImage;



/**
 * 8.2 用UIBezierPath绘制圆形
 * 用涂层让图片变成圆形会让程序卡，效率低
 */
- (UIImage *)cycle_circleImage_BezierPathMethod;


/**  9.根据传入的本地图片名 变成圆形图片*/
+ (instancetype)cycle_circleImage:(NSString *)imageName;




/** 
 * 10.直接将图片变成Square
 * @param coreRadius : 边角大小
 */
- (UIImage *)cycle_SquareImageWithCornerRadius:(CGFloat)coreRadius;


/**
 *  11.用UIBezierPath绘制带边框的圆形图片
 * @param borderW : 边宽
 * @param borderColor : 边框颜色
 * @param image : 图片
 */
+ (UIImage *)cycle_imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image;

////根据一个字符串通过base64转成图片
+ (UIImage *)cycle_ImageFromBase64String:(NSString *)base64Str;


@end
