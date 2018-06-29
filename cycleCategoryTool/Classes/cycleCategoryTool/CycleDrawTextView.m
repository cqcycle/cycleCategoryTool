//
//  CycleDrawTextView.m
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/5/30.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleDrawTextView.h"

@implementation CycleDrawTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //垂直方向上有弹簧效果
        self.alwaysBounceVertical = YES;
        //初始字体
        self.font = [UIFont systemFontOfSize:16];
        //初始颜色
        self.placeHolderColor = [UIColor lightGrayColor];
        
        //监听文字改变
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}
#pragma mark --- 移除通知
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark --  监听文字改变
- (void)textDidChange{
    //重绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    //有文字就不需要重新绘制
    if (self.hasText)return;
    
   //占位文字和光标之间的位置
    rect.origin.x = 4;
    rect.origin.y = 7;
    rect.size.width -=2*rect.origin.x;
    
    //设置一些属性
    NSMutableDictionary *attres = [NSMutableDictionary dictionary];
    //设置默认占位文字颜色（首先需要初始化）
    attres[NSForegroundColorAttributeName] = self.placeHolderColor;
    //设置字体
    attres[NSFontAttributeName] = self.font;
    [self.placeHolder drawInRect:rect withAttributes:attres];
}
#pragma mark -- 重写父类改变字体的方法
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    //重绘
    [self setNeedsDisplay];
}
#pragma mark --- 重写父类改变text方法
-(void)setText:(NSString *)text{
    [super setText:text];
    //重绘
    [self setNeedsDisplay];
}
#pragma mark -- 如果是富文本
-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    //重绘
    [self setNeedsDisplay];
}
#pragma mark -- 改变颜色
-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor = placeHolderColor;
    //重新绘制
    [self setNeedsDisplay];
}
#pragma mark --- 占位文字
-(void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = [placeHolder copy];
    //重新绘制
    [self setNeedsDisplay];
}

@end
