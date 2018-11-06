//
//  UIViewController+CurrentController.h
//  XDRouterDemo
//
//  Created by CumminsTY on 2018/11/6.
//  Copyright © 2018 --. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (CurrentController)
+ (UIViewController *)getCurrent;

@end

NS_ASSUME_NONNULL_END
