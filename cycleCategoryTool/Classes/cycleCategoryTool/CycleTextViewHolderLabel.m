//
//  CycleTextViewHolderLabel.m
//  BaiSiBuDeQiJie
//
//  Created by hd on 16/6/1.
//  Copyright © 2016年 Cycle. All rights reserved.
//

#import "CycleTextViewHolderLabel.h"
#import "UIView+CycleFrame.h"
@interface CycleTextViewHolderLabel()
/**3.占位文字的label*/
@property (strong, nonatomic) UILabel *placeHolderLabel;
@end
@implementation CycleTextViewHolderLabel
/**3.1懒加载*/
-(UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        UILabel *placeHolderLabel = [[UILabel alloc]init];
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.c_x = 4;
        placeHolderLabel.c_y = 7;
        [self addSubview:placeHolderLabel];
        
        _placeHolderLabel = placeHolderLabel;
    }
    return _placeHolderLabel;
}
#pragma mark --- 4.设置尺寸
-(void)layoutSubviews{
    [super layoutSubviews];
    self.placeHolderLabel.c_width = self.c_width-2*self.placeHolderLabel.c_x;
    [self.placeHolderLabel sizeToFit];
   
}
#pragma mark --- 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
       //1.初始化字体
        self.font = [UIFont systemFontOfSize:15];
        //2.初始化颜色
        self.placeHolderColor = [UIColor lightGrayColor];
        //5.监听文字输入(有文字,占位文字隐藏)
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    return self;
}
#pragma mark --- 5.1 监听文字输入
- (void)textDidChange{
    //5.1 监听文字输入(有文字,占位文字隐藏)
    self.placeHolderLabel.hidden = self.hasText;
}
#pragma mark --- 5.2 销毁
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark --- 1.1 重写父类修改字体
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeHolderLabel.font = self.font;
    //适当时候刷新界面
    [self setNeedsLayout];
}
#pragma mark --- 1.2 修改占位文字字体的时候
-(void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = [placeHolder copy];
    
    self.placeHolderLabel.text=placeHolder;
    
    //适当时候刷新界面
    [self setNeedsLayout];
}
#pragma mark --- 2.1 修改占位文字颜色
-(void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor = placeHolderColor;
    
    self.placeHolderLabel.textColor = placeHolderColor;

}
#pragma mark --- 1.3 修改文字
-(void)setText:(NSString *)text{
    [super setText:text];
    //是否有文字,输入判断是否隐藏占位文字
    [self textDidChange];
}
#pragma mark --- 1.4 修改文字
- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    //是否有文字,输入判断是否隐藏占位文字
    [self textDidChange];
}
/**
 * setNeedsDisplay方法 : 会在恰当的时刻自动调用drawRect:方法
 * setNeedsLayout方法 : 会在恰当的时刻调用layoutSubviews方法
 */
@end
