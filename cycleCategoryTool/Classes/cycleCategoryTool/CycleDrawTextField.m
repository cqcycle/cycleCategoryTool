//
//  CycleDrawTextField.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/4/10.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleDrawTextField.h"
#import <objc/runtime.h>

static NSString *const GetPlaceHolderColor = @"_placeholderLabel.textColor";

@implementation CycleDrawTextField

//纯代码
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
//xib
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

//初始化
- (void)setup{
    //1.设置光标颜色
    if (!self.c_tintColor) {
        self.c_tintColor = [UIColor lightGrayColor];
    }
    self.tintColor = self.c_tintColor;
    //2.设置默认的占位文字颜色
    if (!self.c_placeHolderNormalColor) {
        self.c_placeHolderNormalColor = [UIColor grayColor];
    }
    ///点击文本框后颜色
    if (!self.c_placeHolderHightLightedColor) {
        self.self.c_placeHolderHightLightedColor = [UIColor blackColor];
    }
    
    //当失去焦点的时候是灰色
    [self resignFirstResponder];
    
    
    
    //    //方法一:将系统的tabBar转化为自己定义的一个tabBar
    
    //    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    //    //方法二:消息(需要在点击项目,收索msg改为NO,此时可以打出Objc_msgSend()),self表示发送者,SEL(setTabBar:)表示发送什么,tabBar这里表示具体内容,属于底层
    
    //            objc_msgSend(self, @selector(setTabBar:),tabBar);
    //    objc_msgSend(self,@selector(Back),);
    
    //        NSLog(@"002:%@",self.tabBar);
    
    //监听键盘出来的事件
    [self addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    //监听键盘下去的事件
    [self addTarget:self action:@selector(EditingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
    //监听text值的改变的事件
    [self addTarget:self action:@selector(textfieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
}

//重写父类方法
-(BOOL)resignFirstResponder{
    [self setValue:self.c_placeHolderNormalColor forKeyPath:GetPlaceHolderColor];
    
    
    return [super resignFirstResponder];
}

-(BOOL)becomeFirstResponder{
    //此时设置聚焦时候的蚊子颜色
    [self setValue:self.c_placeHolderHightLightedColor forKeyPath:GetPlaceHolderColor];
    self.tintColor = self.c_tintColor;
    return [super becomeFirstResponder];
}
/** 默认占位文字颜色 */
-(void)setC_placeHolderNormalColor:(UIColor *)c_placeHolderNormalColor{
    _c_placeHolderNormalColor = c_placeHolderNormalColor;

}
/** 点击文本框占位文字颜色 */
-(void)setC_placeHolderHightLightedColor:(UIColor *)c_placeHolderHightLightedColor{
    _c_placeHolderHightLightedColor = c_placeHolderHightLightedColor;

}
/** 光标颜色颜色 */
-(void)setC_tintColor:(UIColor *)c_tintColor{
    _c_tintColor = c_tintColor;
    self.tintColor = c_tintColor;
}


/** 光标与文字的间距 */
-(void)setC_tintContentW:(CGFloat)c_tintContentW{
    _c_tintContentW = c_tintContentW;
}
/** 光标位置（目前居中，只需要左右设置） */
-(void)setC_tintX:(CGFloat)c_tintX{
    _c_tintX = c_tintX;
    
}


#pragma mark --- 4.改变光标位置以及光标跟内容之间的间距
// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if (self.c_tintContentW==0) {
        self.c_tintContentW = 8.00;
    }
    CGRect inset = CGRectMake(bounds.origin.x+self.c_tintContentW, bounds.origin.y, bounds.size.width -20, bounds.size.height);//更好理解些
    return inset;
}
// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds
{
    if (self.c_tintContentW==0) {
        self.c_tintContentW = 8.00;
    }
    CGRect inset = CGRectMake(bounds.origin.x+self.c_tintContentW, bounds.origin.y, bounds.size.width-25, bounds.size.height);//更好理解些
    return inset;
}

// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    if (self.c_tintX==0) {
        self.c_tintX = 5.00;
    }
    CGRect inset;
    if (self.text.length > 0) {
        // 这里100可能需要自己调整一下使其居中即可
        inset = CGRectMake(bounds.origin.x + self.c_tintX, bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    }
    //    NSLog(@"%@",self.text);
    else {
        
        inset = CGRectMake(bounds.origin.x+self.c_tintX, bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    }
    return inset;
}

#pragma mark --- 1.监听键盘出来的事件
- (void)EditingDidBegin:(CycleDrawTextField *)textField{
    [self setValue:self.c_placeHolderHightLightedColor forKeyPath:GetPlaceHolderColor];
}
#pragma mark --- 2.监听键盘下去的事件
- (void)EditingDidEnd:(CycleDrawTextField *)textField{
    NSLog(@"结束：%@",textField.text);
    [self setValue:self.c_placeHolderNormalColor forKeyPath:GetPlaceHolderColor];
}
#pragma mark --- 3.监听text值的改变的事件
- (void)textfieldDidChange:(CycleDrawTextField *)textField{
    
    if (self.valueChangeBlock) {
        self.valueChangeBlock(textField, textField.text);
    }
}


@end
