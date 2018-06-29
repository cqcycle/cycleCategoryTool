//
//  UITextField+CycleTextField.m
//  MyCycleTool
//
//  Created by dihuijun on 17/7/12.
//  Copyright © 2017年 Cycle. All rights reserved.
//

#import "UITextField+CycleTextField.h"

static NSString *const GetPlaceHolderColor = @"_placeholderLabel.textColor";


@implementation UITextField (CycleTextField)

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    //1.如果先设置占位文字颜色，后写文字就可能会文字不变成自己想要的颜色，加上这句就好了（设置颜色和内容不是按顺序来的）
    NSString *tempPlaceHolder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = tempPlaceHolder;
    //2.（如果传入nil）恢复默认的占位文字颜色
    if(placeholderColor == nil){
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    //3.设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:GetPlaceHolderColor];
}

-(UIColor *)placeholderColor{
    return [self valueForKeyPath:GetPlaceHolderColor];
}

@end
