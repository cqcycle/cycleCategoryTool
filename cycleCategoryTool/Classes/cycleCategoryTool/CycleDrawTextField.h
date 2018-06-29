//
//  CycleDrawTextField.h
//  BaiSiBuDeQiJie
//
//  Created by Cycle on 16/4/10.
//  Copyright © 2016年 Cycle. All rights reserved.
//  失去焦点和获得焦点   占位文字的改变

#import <UIKit/UIKit.h>
@class CycleDrawTextField;
typedef void(^textFieldValueDidChangeBlock)(CycleDrawTextField *field,NSString *txt);
@interface CycleDrawTextField : UITextField

/** 内容改变 */
@property (nonatomic, copy) textFieldValueDidChangeBlock valueChangeBlock;



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
