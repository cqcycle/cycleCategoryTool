//
//  CycleCollectionView.m
//  cycleCategoryTool_Example
//
//  Created by ddy on 2018/7/2.
//  Copyright © 2018年 cqcycle. All rights reserved.
//

#import "CycleCollectionView.h"

@implementation CycleCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
         NSLog(@"测试传入Class是否来了");
    }
    return self;
}

@end
