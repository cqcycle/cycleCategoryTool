//
//  CycleDefines.h
//  iPhoneX
//
//  Created by ddy on 2018/5/16.
//  Copyright © 2018年 ddy. All rights reserved.
//

#ifndef CycleDefines_h
#define CycleDefines_h



/// 设置图片
#define kCycleImageNamed(s)  [UIImage imageNamed:s]
/// 设置加粗的字体
#define kCycleBoldFont(f)  [UIFont boldSystemFontOfSize:f]
/// 字体
#define kCycleFont(selfFont) [UIFont systemFontOfSize:selfFont]
/** 屏幕宽度和高度 */
#define kCycleScreen_width [UIScreen mainScreen].bounds.size.width
#define kCycleScreen_height [UIScreen mainScreen].bounds.size.height
/** 代码块self的弱应用 */
#define CycleWS(weakSelf) __weak __typeof(&*self)weakSelf = self
/** 主窗口 */
#define kCycleKeyWindow [UIApplication sharedApplication].keyWindow
/**  iOS版本 */
#define CycleIOSVersion(version) ([UIDevice currentDevice].systemVersion.doubleValue >=(version))


///判断字符串是否为空
#define CycleKisNilString(__String) (__String==nil || __String == (id)[NSNull null] || ![__String isKindOfClass:[NSString class]] || [__String isEqualToString:@""] || [[__String stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])

///打印
#if DEBUG
#define CycleLog(FORMAT,...)   NSLog(@"%@文件%d行输出打印:%@",[[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"] lastObject], __LINE__,[NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
#define NSLog(FORMAT, ...) nil
#endif



#pragma mark -- iPhone X适配
//判断是否是iPhone X
#define kCycleDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/// 宏定义 获取当前的 状态栏的高度
#define kCycleStatus_Height (kDevice_Is_iPhoneX ? 44:20)

// 适配iPhone x 底栏高度
#define kCycleBar_Height  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83.0:49.0)


///导航高度
#define kCycleNav_Height  (kDevice_Is_iPhoneX ? 84.0f : 64.0f)
//#define kNav_Height  (kDevice_Is_iPhoneX ? [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height : 64.0)



// UIScreen width.
#define  LL_ScreenWidth   [UIScreen mainScreen].bounds.size.width

// UIScreen height.
#define  LL_ScreenHeight  [UIScreen mainScreen].bounds.size.height
// iPhone X
#define  LL_iPhoneX (LL_ScreenWidth == 375.f && LL_ScreenHeight == 812.f ? YES : NO)

// Status bar height.
#define  LL_StatusBarHeight      (LL_iPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define  LL_NavigationBarHeight  44.f

// Tabbar height.
#define  LL_TabbarHeight         (LL_iPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  LL_TabbarSafeBottomMargin         (LL_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  LL_StatusBarAndNavigationBarHeight  (LL_iPhoneX ? 88.f : 64.f)

#define LL_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})



#endif /* CycleDefines_h */
