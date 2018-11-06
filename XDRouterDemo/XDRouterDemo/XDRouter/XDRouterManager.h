//
//  XDRouterManager.h
//  XDRouterDemo
//
//  Created by CumminsTY on 2018/11/6.
//  Copyright © 2018 --. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XDRouterManager : NSObject

+(instancetype)sharedManager;



/**
 push 到一个vc

 @param vcName 目标vc
 @param fromvc 当前vc
 @param data 参数
 @return 是否 成功
 */
- (BOOL)pushVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *_Nullable)data;


/**
 modal 到一个vc

 @param vcName 目标vc
 @param fromvc 当前vc
 @param data 参数
 @return ，，
 */
- (BOOL)presentVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *_Nullable)data;


@end

NS_ASSUME_NONNULL_END
