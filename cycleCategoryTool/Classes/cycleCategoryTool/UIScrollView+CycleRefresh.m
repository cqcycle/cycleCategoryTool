//
//  UIScrollView+CycleRefresh.m
//  JCJD
//
//  Created by zl on 2017/12/4.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "UIScrollView+CycleRefresh.h"
#import <objc/runtime.h>
#define kObservePath        @"contentOffset"

@implementation UIScrollView (CycleRefresh)

static char topShowViewKey;

-(void)addHeaderRefreshWithTarget:(id)target action:(SEL)action
{
    if (!self.topShowView)
    {
        self.topShowView = [[CycleCustomRefreshView alloc] init];
    }
    self.topShowView.frame = CGRectMake(0, -100, self.frame.size.width, 100);
    self.topShowView.parentView = self;
    self.topShowView.actionTarget = target;
    self.topShowView.action = action;
    [self addSubview:self.topShowView];
    //兼听滚动便宜
    [self addObserver:self forKeyPath:kObservePath options:NSKeyValueObservingOptionNew context:nil];
}

-(void)cycle_beginHeaderRefresh
{
    [self.topShowView cycle_beginHeaderRefresh];
}
-(void)cycle_endHeaderRefresh
{
    [self.topShowView cycle_endHeaderRefresh];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([kObservePath isEqualToString:keyPath])
    {
        NSValue *point = (NSValue *)[change objectForKey:@"new"];
        CGPoint p = [point CGPointValue];
        [self.topShowView cycle_adjustY:-p.y];
    }
    
    
}
-(CycleCustomRefreshView *)topShowView
{
    return objc_getAssociatedObject(self, &topShowViewKey);
}

-(void)setTopShowView:(CycleCustomRefreshView *)topShowView
{
    objc_setAssociatedObject(self, &topShowViewKey, topShowView, OBJC_ASSOCIATION_RETAIN);
}

-(void)dealloc
{
    if (self.topShowView)//注册过刷新的必须要除移开监听
    {
        [self removeObserver:self forKeyPath:kObservePath context:nil];
    }
}
@end
