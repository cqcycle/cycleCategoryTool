//
//  CycleCustomRefreshView.h
//  JCJD
//
//  Created by zl on 2017/12/4.
//  Copyright © 2017年 zl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,RefreshStatus)
{
    RefreshStatus_Normal = 1,
    RefreshStatus_BeginRefresh,
    RefreshStatus_Refreshing,
};


@interface CycleCustomRefreshView : UIView

@property (nonatomic,strong)UILabel *updateLabel;
@property (nonatomic,weak) id actionTarget;
@property (nonatomic)SEL action;
@property (nonatomic,strong) UIScrollView *parentView;
@property (nonatomic) RefreshStatus refreshStatus;

-(void)cycle_beginHeaderRefresh;
-(void)cycle_endHeaderRefresh;

-(void)cycle_adjustY:(CGFloat)y;


@end
