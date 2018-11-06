//
//  UIViewController+XDRouter.h
//  XDRouterDemo
//
//  Created by CumminsTY on 2018/11/6.
//  Copyright © 2018 --. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XDRouter)
- (BOOL)xd_pushVcName:(NSString *)vcName;

- (BOOL)xd_presentVcName:(NSString *)vcName;

- (BOOL)xd_pushVcName:(NSString *)vcName withData:(NSDictionary *)data;

- (BOOL)xd_presentVcName:(NSString *)vcName withData:(NSDictionary *)data;



@end

NS_ASSUME_NONNULL_END
