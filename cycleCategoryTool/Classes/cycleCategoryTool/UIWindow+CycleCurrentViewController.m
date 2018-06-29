//
//  UIWindow+CycleCurrentViewController.m
//  MyCycleTool
//
//  Created by ddy on 2018/5/3.
//  Copyright © 2018年 Cycle. All rights reserved.
//

#import "UIWindow+CycleCurrentViewController.h"

@implementation UIWindow (CycleCurrentViewController)
+ (UIViewController *)cycle_currentViewController{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIViewController *topViewController = [window rootViewController];
    while (true) {
        if (topViewController.presentedViewController) {
            topViewController = topViewController.presentedViewController;
        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController]) {
            topViewController = [(UINavigationController *)topViewController topViewController];
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        } else {
            break;
        }
    }
    return topViewController;
}
@end
