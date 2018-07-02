//
//  CycleViewController.m
//  cycleCategoryTool
//
//  Created by cqcycle on 06/29/2018.
//  Copyright (c) 2018 cqcycle. All rights reserved.
//

#import "CycleViewController.h"
//测试
#import "CycleCollectionView.h"

#import "CycleCollectionViewCell.h"

#import <cycleCategoryTool/CycleDefines.h>

#import <cycleCategoryTool/UICollectionView+CycleCreat.h>

@interface CycleViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>{
    CycleCollectionView *collectionView;
}

@end
static NSString *const kCellID = @"CycleCollectionViewCell";
@implementation CycleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    collectionView = [CycleCollectionView cycle_creatCollectionViewFrame:CGRectMake(0, 0, kCycleScreen_width, kCycleScreen_height) collectionView:[CycleCollectionView class] layout:layout delegate:self datasource:self];
    collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:collectionView];
    ///注册cell
    [collectionView registerClass:[CycleCollectionViewCell class] forCellWithReuseIdentifier:kCellID];
    
}

#pragma mark --- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.selectedIndexPath = indexPath;
    
    
    return cell;
}
#pragma mark --- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kCycleScreen_width - 2) / 3.0;
    return CGSizeMake(width, width);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
@end
