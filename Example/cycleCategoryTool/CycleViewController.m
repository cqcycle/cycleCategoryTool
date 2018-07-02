//
//  CycleViewController.m
//  cycleCategoryTool
//
//  Created by cqcycle on 06/29/2018.
//  Copyright (c) 2018 cqcycle. All rights reserved.
//

#import "CycleViewController.h"
#import "CycleCategoryHelp.h"
@interface CycleViewController ()

@end

@implementation CycleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //只有图片
    [UIButton cycle_creatBFrame:CGRectZero Btn:nil BNorImg:nil BHigImg:nil BClick:^(__kindof UIButton *button) {
    
    }];
    //只有文字
    [UIButton cycle_creatBFrame:CGRectZero Btn:nil BTitle:nil BColor:nil BFont:12 BClick:^(__kindof UIButton *button) {
        
    }];
    //图和文字
    [UIButton cycle_creatBFrame:CGRectZero Btn:nil BTitle:nil BColor:nil BFont:12 BNorImg:nil BHigImg:nil BClick:^(__kindof UIButton *button) {
        
    }];
    
}

@end
