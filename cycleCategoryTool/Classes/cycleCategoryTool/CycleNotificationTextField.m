//
//  CycleNotificationTextField.m
//  MyCycleTool
//
//  Created by dihuijun on 17/7/10.
//  Copyright © 2017年 Cycle. All rights reserved.
//

#import "CycleNotificationTextField.h"

static NSString *const textField_PlaceHolderLabel = @"_placeholderLabel.textColor";
@implementation CycleNotificationTextField

///xib
-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}
///纯代码
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

///初始化
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
    [self setValue:self.c_placeHolderNormalColor forKeyPath:textField_PlaceHolderLabel];
    ///点击文本框后颜色
    if (!self.c_placeHolderHightLightedColor) {
        self.self.c_placeHolderHightLightedColor = [UIColor blackColor];
    }
    
    //3.发送通知监听谁发送的通知（addObserver：self接收，object：发送者）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(beginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self];
}

///dealoc
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/**  开始监听 */
- (void)beginEditing:(NSNotification *)note
{
    //打印谁接收的(测试)

    //设置白色
    [self setValue:self.c_placeHolderHightLightedColor forKeyPath:textField_PlaceHolderLabel];
}
/**  结束监听 */
- (void)endEditing:(NSNotification *)note
{
    CycleNotificationTextField *txtfield = (CycleNotificationTextField *)note.object;
    NSLog(@"结束：%@",txtfield.text);
    //设置灰色
    [self setValue:self.c_placeHolderNormalColor forKeyPath:textField_PlaceHolderLabel];
}
/**  文字改变 */
- (void)textFieldDidChange:(NSNotification *)note{
    CycleNotificationTextField *txtfield = (CycleNotificationTextField *)note.object;
    if (self.valueChangeBlock) {
        self.valueChangeBlock(txtfield, txtfield.text);
    }
}

/** 默认占位文字颜色 */
-(void)setC_placeHolderNormalColor:(UIColor *)c_placeHolderNormalColor{
    _c_placeHolderNormalColor = c_placeHolderNormalColor;
//    [self setValue:self.c_placeHolderNormalColor forKeyPath:textField_PlaceHolderLabel];
}
/** 点击文本框占位文字颜色 */
-(void)setC_placeHolderHightLightedColor:(UIColor *)c_placeHolderHightLightedColor{
    _c_placeHolderHightLightedColor = c_placeHolderHightLightedColor;
//    [self setValue:self.c_placeHolderHightLightedColor forKeyPath:textField_PlaceHolderLabel];
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
@end
