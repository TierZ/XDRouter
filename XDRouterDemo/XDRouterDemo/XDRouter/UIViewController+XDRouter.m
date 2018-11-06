//
//  UIViewController+XDRouter.m
//  XDRouterDemo
//
//  Created by CumminsTY on 2018/11/6.
//  Copyright © 2018 --. All rights reserved.
//

#import "UIViewController+XDRouter.h"
#import "XDRouterManager.h"

@implementation UIViewController (XDRouter)

- (BOOL)xd_pushVcName:(NSString *)vcName{
    return [[XDRouterManager sharedManager]pushVcName:vcName from:self withData:nil];
}

- (BOOL)xd_presentVcName:(NSString *)vcName{
    return [[XDRouterManager sharedManager] presentVcName:vcName from:self withData:nil];
}

- (BOOL)xd_pushVcName:(NSString *)vcName withData:(NSDictionary *)data{
    return [[XDRouterManager sharedManager]pushVcName:vcName from:self withData:data];

}

- (BOOL)xd_presentVcName:(NSString *)vcName withData:(NSDictionary *)data{
    return [[XDRouterManager sharedManager] presentVcName:vcName from:self withData:data];

}
@end
