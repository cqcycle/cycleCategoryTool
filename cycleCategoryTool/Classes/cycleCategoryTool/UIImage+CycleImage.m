//
//  UIImage+CycleImage.m
//  ZBWeiBo
//
//  Created by teacher on 15-12-17.
//  Copyright (c) 2015年 Cycle. All rights reserved.
//
#import "UIImage+CycleImage.h"

@implementation UIImage (CycleImage)
/** 1.加载最原始的图片，没有渲染 */
+ (instancetype)cycle_imageWithOriginalName:(NSString *)imageName
{
   UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
/** 2.返回一张自由拉伸的图片*/
+ (instancetype)cycle_imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
/** 3.返回一张自由拉伸的图片*/
+ (UIImage *)cycle_resizedImageWithName:(NSString *)name
{
    return [self cycle_resizedImageWithName:name left:0.5 top:0.5];
}
/** 4.返回拉伸的图片*/
+ (UIImage *)cycle_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

/** 5.将图片转成圆形*/
+ (instancetype)cycle_circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 *  6.返回主bundle的图片对象
 *
 */
+(UIImage *)cycle_imageFromMainBundleWithName:(NSString *)name{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    return [UIImage imageWithContentsOfFile:imagePath];
    
}

/** 7.图片尺寸*/
- (UIImage*)cycle_imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}





/** 8.1 直接将图片变成圆角 */
- (UIImage *)cycle_circleImage{
    
    /*
     BOOL opaque:透明度
     */
    
    
    //1.开始绘图
    UIGraphicsBeginImageContext(self.size);
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //2.获得上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
      CGContextSetRGBFillColor (ref,  1, 0, 0, 1.0);//设置填充颜色
    //3.添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ref, rect);
////
//    
//    float fw = 180;
//    float fh = 280;
//    
//    CGContextMoveToPoint(ref, fw, fh-20);  // 开始坐标右边开始
//    CGContextAddArcToPoint(ref, fw, fh, fw-20, fh, 10);  // 右下角角度
//    CGContextAddArcToPoint(ref, 120, fh, 120, fh-20, 10); // 左下角角度
//    CGContextAddArcToPoint(ref, 120, 250, fw-20, 250, 10); // 左上角
//    CGContextAddArcToPoint(ref, fw, 250, fw, fh-20, 10); // 右上角
//    CGContextClosePath(ref);
//    CGContextDrawPath(ref, kCGPathFillStroke); //根据坐标绘制路径
    
//    cgcontext
//    self drawInRect:<#(CGRect)#>
    //4.裁剪
    CGContextClip(ref);
    //5.将图片画上去
    [self drawInRect:rect];
    
    //6.得到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //7.结束绘图
    UIGraphicsEndImageContext();
    
    return image;
    
}
/**
 * 8.2 用UIBezierPath绘制圆形
 * 用涂层让图片变成圆形会让程序卡，效率低
 */
- (UIImage *)cycle_circleImage_BezierPathMethod{
    //1.开启跟原始图片一样大小的上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    //2.设置圆形裁剪区域
    //2.1 绘制一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //2.2 把圆形的路径设置成裁剪区域
    [path addClip];//超过裁剪区域以外的内容都给裁剪掉
    //3.把图片绘制到上下文当中(超过裁剪区域以外的内容都给裁剪掉)
    [self drawAtPoint:CGPointZero];
    //4.从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}





/**  9.根据传入的本地图片名 变成圆形图片*/
+ (instancetype)cycle_circleImage:(NSString *)imageName{
    return [[self imageNamed:imageName]cycle_circleImage];
}








/** 10.直接将图片变成Square */
- (UIImage *)cycle_SquareImageWithCornerRadius:(CGFloat)coreRadius{
    
    /*
     BOOL opaque:透明度
     */
    
    
    //1.开始绘图（开启上下文）
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //2.获得上下文
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) cornerRadius:coreRadius];
    //把圆形的路径设置成裁剪区域
    [path addClip];
    //把图片绘制到上下文当中(超过裁剪区域以外的内容都给裁剪掉)
    [self drawAtPoint:CGPointZero];
    
    //3.得到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //4.结束绘图
    UIGraphicsEndImageContext();
    
    return image;
    
}


/**
 *  11.用UIBezierPath绘制带边框的圆形图片
 */
+ (UIImage *)cycle_imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image{
    
    //0.加载图片
    //UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    //1.确定边框宽度
    //CGFloat borderW = 5;
    //2.开启一个上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //3.绘制大圆,显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path addClip];
    [path fill];//自动将路径添加到上下文
    //4.绘制一个小圆,把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];//自动将路径添加到上下文，并且超过裁剪区域的路径直接裁减掉，此方法会裁减掉超过大圆的部分
    //5.把图片绘制到上下文当中,drawAtPoint画出的图片大小和image大小相同
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    //6.从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

////根据一个字符串通过base64转成图片
+ (UIImage *)cycle_ImageFromBase64String:(NSString *)base64Str{
    NSData *decodeData = [[NSData alloc]initWithBase64EncodedString:base64Str options:(NSDataBase64DecodingIgnoreUnknownCharacters)];
    // 将NSData转为UIImage
    UIImage *decodedImage = [UIImage imageWithData:decodeData];
    return decodedImage;
}










@end
