//
//  XDRouterManager.m
//  XDRouterDemo
//
//  Created by CumminsTY on 2018/11/6.
//  Copyright © 2018 --. All rights reserved.
//

#import "XDRouterManager.h"
#import "UIViewController+CurrentController.h"

#define LogError(str) [NSString stringWithFormat:@"YINRouteError: %@",str]

@implementation XDRouterManager


/**
 单利

 @return ，。
 */
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static XDRouterManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}




//处理app间的通信、跳转等事件
//- (BOOL)appActionWithUrl:(NSURL *)url{
//    if (![[[YINRouteConfig shareInstance]urlSchemes] containsObject:url.scheme]) {
//        return NO;
//    }
//    YINRouteURLData *data = [YINRouteURLData urlDataWithUrl:url];
//    if (data.routeType==YINAppRouteTypePage) {
//        //页面跳转类型
//        return [self pushVcName:data.controllerName from:nil withData:data.data];
//    }else{
//        //方法执行
//        NSString *actionName = data.actionName;
//        NSDictionary *actionData = data.data;
//        if (self.routeActionBlock) {
//            self.routeActionBlock(actionName, actionData);
//        }
//    }
//    return YES;
//}

- (BOOL)push:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;{
    UIViewController *a = fromvc?fromvc:[[XDRouterManager sharedManager] currentController];
    if (!vc) {
        return NO;
    }
    [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try {
            [vc setValue:obj forKey:key];
        } @catch (NSException *exception) {
        } @finally {
        }
    }];
    vc.hidesBottomBarWhenPushed = YES;
    [a.navigationController pushViewController:vc animated:YES];
    return YES;
}

- (BOOL)present:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;{
    UIViewController *a = fromvc?fromvc:[[XDRouterManager sharedManager] currentController];
    if (!vc) {
        return NO;
    }
    [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try {
            [vc setValue:obj forKey:key];
        } @catch (NSException *exception) {
        } @finally {
        }
    }];
    [a presentViewController:vc animated:YES completion:^{
    }];
    return YES;
}

//调用某个页面
- (BOOL)pushVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *)data{
    UIViewController *vc = [[XDRouterManager sharedManager] toViewController:vcName];
    return [self push:vc from:fromvc withData:data];
}

- (BOOL)presentVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *)data{
    UIViewController *vc = [[XDRouterManager sharedManager] toViewController:vcName];
    return [self present:vc from:fromvc withData:data];
}




#pragma mark - private

/**
 获取目标vc

 @param vcName vcname
 @return vc
 */
-(UIViewController*)toViewController:(NSString*)vcName{
    if (!vcName||vcName.length==0) {
        LogError(@"请传入class名");
        return nil;
    }
//    if ([[YINRouteURLPathRegist shareInstance].registDict objectForKey:name]) {
//        vcName = [[YINRouteURLPathRegist shareInstance].registDict objectForKey:vcName];
//    }
    id vc = [[NSClassFromString(vcName) alloc] init];
    if (vc) {
        if ([vc isKindOfClass:[UIViewController class]]) {
            return vc;
        }
        NSString *error = [NSString stringWithFormat:@"Class %@不是controller",vcName];
        LogError(error);
        return nil;
    }else{
        NSString *error = [NSString stringWithFormat:@"Class %@不存在",vcName];
        LogError(error);
        return nil;
    }
}


/**
 获取当前的vc

 @return vc
 */
-(UIViewController*)currentController{
    return [UIViewController getCurrent];
}

@end
