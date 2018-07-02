//
//  CycleCollectionViewCell.m
//  cycleCategoryTool_Example
//
//  Created by ddy on 2018/7/2.
//  Copyright © 2018年 cqcycle. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import <cycleCategoryTool/UILabel+CycleCreat.h>
@implementation CycleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *label = [UILabel cycle_creatWFrame:CGRectMake(5, 5, 80, 60) Label:nil text:@"北京欢迎您" tColor:[UIColor orangeColor] tFont:16 labelClick:^(__kindof UILabel *label) {
            NSLog(@"%@---%zd---%zd",label.text,self.selectedIndexPath.section,self.selectedIndexPath.item);
        }];
        label.numberOfLines = 0;
        [self.contentView addSubview:label];
    }
    return self;
}



@end
