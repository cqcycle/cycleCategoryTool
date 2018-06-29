//
//  CycleTextViewHolderLabel.h
//  BaiSiBuDeQiJie
//
//  Created by hd on 16/6/1.
//  Copyright © 2016年 Cycle. All rights reserved.
//  占位文字是label,并且当拖动textView的时候整体弹簧效果,很自然

#import <UIKit/UIKit.h>

@interface CycleTextViewHolderLabel : UITextView
/** 占位文字*/
@property(nonatomic,copy)NSString *placeHolder;
/** 文字颜色*/
@property(nonatomic,strong)UIColor *placeHolderColor;

@end
