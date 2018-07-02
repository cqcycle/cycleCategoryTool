//
//  CycleTableView.m
//  cycleCategoryTool_Example
//
//  Created by ddy on 2018/7/2.
//  Copyright © 2018年 cqcycle. All rights reserved.
//

#import "CycleTableView.h"

@implementation CycleTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        NSLog(@"测试传入Class是否来了");
    }
    return self;
}

@end
