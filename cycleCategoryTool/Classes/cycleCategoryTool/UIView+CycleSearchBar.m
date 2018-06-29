//
//  UIView+CycleSearchBar.m
//  MyCycleTool
//
//  Created by ddy on 2018/1/3.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import "UIView+CycleSearchBar.h"

@implementation UIView (CycleSearchBar)
/**
 *  创建searchBar的View
 */
+ (__kindof UIView *)cycle_setupSearchBarWithDelegate:(id<UISearchBarDelegate>)delegate isBecomeFirstResponse:(BOOL)flg andTitle:(NSString *)title{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-2*15, 25)];
    UISearchBar *search = [[UISearchBar alloc]init];
    [titleView addSubview:search];
    if (flg) {
        ///隐藏search本身的取消按钮
        search.showsCancelButton = YES;
        [search becomeFirstResponder];
    }
    search.frame = titleView.bounds;
    search.delegate = delegate;
    search.placeholder = title;
    search.barTintColor = [UIColor whiteColor];
    
    search.tintColor = [UIColor blueColor];//取消按钮
    UITextField *searchField = [search valueForKey:@"_searchField"];
    if (searchField) {
        [searchField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        [searchField setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    }
    
    
    return titleView;
}
@end
