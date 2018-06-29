//
//  CycleDrawTextView.h
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/30.
//  Copyright © 2016年 Cycle. All rights reserved.
//  占位文字显示与隐藏通过绘图知识

#import <UIKit/UIKit.h>

@interface CycleDrawTextView : UITextView
/**占位文字*/
@property (nonatomic, copy) NSString *placeHolder;
/**文字颜色*/
@property (nonatomic, strong) UIColor *placeHolderColor;

@end
