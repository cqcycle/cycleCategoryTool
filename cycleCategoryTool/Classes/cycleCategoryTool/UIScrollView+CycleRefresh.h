//
//  UIScrollView+CycleRefresh.h
//  JCJD
//
//  Created by zl on 2017/12/4.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleCustomRefreshView.h"

@interface UIScrollView (CycleRefresh)

@property (nonatomic,strong) CycleCustomRefreshView *topShowView;

-(void)addHeaderRefreshWithTarget:(id)target action:(SEL)action;

-(void)cycle_beginHeaderRefresh;

-(void)cycle_endHeaderRefresh;


@end
