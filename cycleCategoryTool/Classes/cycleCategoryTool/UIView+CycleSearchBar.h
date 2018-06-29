//
//  UIView+CycleSearchBar.h
//  MyCycleTool
//
//  Created by ddy on 2018/1/3.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CycleSearchBar)
/**
 *  创建searchBar的View
 */
+ (__kindof UIView *)cycle_setupSearchBarWithDelegate:(id<UISearchBarDelegate>)delegate isBecomeFirstResponse:(BOOL)flg andTitle:(NSString *)title;
@end
