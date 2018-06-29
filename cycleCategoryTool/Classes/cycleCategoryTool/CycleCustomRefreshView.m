//
//  CycleCustomRefreshView.m
//  JCJD
//
//  Created by zl on 2017/12/4.
//  Copyright © 2017年 zl. All rights reserved.
//

#import "CycleCustomRefreshView.h"

#define kMinOffSetY     100
@implementation CycleCustomRefreshView

-(instancetype)init
{
    if (self = [super init])
    {
        [self addSubview:self.updateLabel];
        self.refreshStatus = RefreshStatus_Normal;
    }
    return self;
}

-(void)layoutSubviews
{
    self.updateLabel.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 20);
}
-(void)cycle_beginHeaderRefresh
{
    self.refreshStatus = RefreshStatus_Refreshing;
}
-(void)cycle_endHeaderRefresh
{
    [self isAdjustToNormal:YES];
    self.refreshStatus = RefreshStatus_Normal;
    
}

-(void)cycle_adjustY:(CGFloat)y
{
    if (self.parentView.isDragging)
    {
        if (y>kMinOffSetY)
        {
            self.refreshStatus = RefreshStatus_BeginRefresh;
        }
        else
        {
            self.refreshStatus = RefreshStatus_Normal;
        }
    }
    else
    {
        if (y>kMinOffSetY)
        {
            self.refreshStatus = RefreshStatus_Refreshing;
        }
    }
}

-(void)isAdjustToNormal:(BOOL)normal
{
    CGFloat y = 0;
    if (!normal)
    {
        y = 50;
    }
    __weak CycleCustomRefreshView *weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.parentView.contentInset = UIEdgeInsetsMake(y, 0, 0, 0);
    }];
}
-(void)doNormalRefresh
{
    self.updateLabel.text = @"下拉刷新....";
}
-(void)doBeginRefresh
{
    self.updateLabel.text = @"释放加载....";
}
-(void)doRefreshing
{
    self.updateLabel.text = @"正在努力加载...";
    [self isAdjustToNormal:NO];
    [self.actionTarget performSelector:self.action withObject:nil afterDelay:0];
}



-(void)setRefreshStatus:(RefreshStatus)refreshStatus
{
    if(_refreshStatus == refreshStatus)
        return;
    
    switch (refreshStatus)
    {
        case RefreshStatus_Normal:
            [self doNormalRefresh];
            break;
        case RefreshStatus_BeginRefresh:
        {
            [self doBeginRefresh];
            break;
        }
        case RefreshStatus_Refreshing:
        {
            [self doRefreshing];
            break;
        }
        default:
            break;
    }
    _refreshStatus = refreshStatus;
}

-(UILabel *)updateLabel
{
    if (_updateLabel == nil)
    {
        _updateLabel = [[UILabel alloc] init];
        _updateLabel.textAlignment = NSTextAlignmentCenter;
        _updateLabel.font = [UIFont systemFontOfSize:13];
        _updateLabel.textColor = [UIColor grayColor];
    }
    return _updateLabel;
}  


@end
