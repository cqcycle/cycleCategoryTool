//
//  CycleNotificationTextField.h
//  MyCycleTool
//
//  Created by dihuijun on 17/7/10.
//  Copyright © 2017年 Cycle. All rights reserved.
//  通过文本框通知的方法

#import <UIKit/UIKit.h>

@class CycleNotificationTextField;


typedef void(^textNotificationFieldValueDidChangeBlock)(
CycleNotificationTextField *field,NSString *txt);

@interface CycleNotificationTextField : UITextField

/** 内容改变 */
@property (nonatomic, copy) textNotificationFieldValueDidChangeBlock valueChangeBlock;

/** 默认占位文字颜色 */
@property (nonatomic, strong) UIColor  *c_placeHolderNormalColor;
/** 点击文本框占位文字颜色 */
@property (nonatomic, strong) UIColor  *c_placeHolderHightLightedColor;
/** 光标颜色颜色 */
@property (nonatomic, strong) UIColor  *c_tintColor;
/** 光标与文字的间距 */
@property (nonatomic, assign) CGFloat  c_tintContentW;
/** 光标位置（目前居中，只需要左右设置） */
@property (nonatomic, assign) CGFloat  c_tintX;

@end
