//
//  CycleCustomLabel.m
//  MyCycleTool
//
//  Created by ddy on 2018/4/11.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import "CycleCustomLabel.h"

@implementation CycleCustomLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}
-(void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

@end
