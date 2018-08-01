//
//  JTRouter.m
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "JTRouter.h"
#import "BaseDelegate.h"
#ifndef MoudleProtocol_Suffix
#define MoudleProtocol_Suffix @"JT"
#endif

@implementation JTRouter

+ (instancetype)router {
    static dispatch_once_t onceToken;
    static JTRouter *rt = nil;
    dispatch_once(&onceToken, ^{
        rt = [[JTRouter alloc] init];
    });
    return rt;
}

- (id)interfaceForProtocol:(Protocol *)p {
    Class cls = [self _clsForProtocol:p];
    id <BaseDelegate> obj = [[cls alloc] init];
    return obj;
}

- (id)interfaceForURL:(NSURL *)url {
    Class cls = [self _clsForUrl:url];
    id <BaseDelegate> obj = [[cls alloc] init];
    obj.params = [self parameterForUrl:url];
    return obj;
}

- (Class)_clsForProtocol:(Protocol *)p {
    NSString *clsString = [NSStringFromProtocol(p) stringByAppendingString:MoudleProtocol_Suffix];
    return NSClassFromString(clsString);
}

- (Class)_clsForUrl:(NSURL *)url {
    NSString *clsString = [url.scheme stringByAppendingString:MoudleProtocol_Suffix];
    return NSClassFromString(clsString);
    
}

- (NSDictionary *)parameterForUrl:(NSURL *)url {
    NSString *urlStr = url.absoluteString;
    NSArray *sepArr = [urlStr componentsSeparatedByString:@"://"];
    NSMutableDictionary *parameterDic = [NSMutableDictionary dictionary];
    if (sepArr.count == 2) {
        NSString *secondStr = sepArr[1];
        if ([secondStr hasPrefix:@"?"]) {
            secondStr = [secondStr substringFromIndex:1];
            NSArray *paraArr = [secondStr componentsSeparatedByString:@"&"];
            if (paraArr.count > 0) {
                for (NSString *paramPath in paraArr) {
                    NSArray *arr = [paramPath componentsSeparatedByString:@"="];
                    [parameterDic setObject:arr[1] forKey:arr[0]];
                }
            } else {
                NSArray *arr = [secondStr componentsSeparatedByString:@"="];
                [parameterDic setObject:arr[1] forKey:arr[0]];
            }
        }
    }
    return parameterDic.copy;
}

- (void)assertForMoudleWithProtocol:(Protocol *)p {
    if (![self _clsForProtocol:p]) {
        NSString *protocolName = NSStringFromProtocol(p);
        NSString *clsName = [protocolName stringByAppendingString: MoudleProtocol_Suffix];
        NSString *reason = [NSString stringWithFormat: @"找不到协议 %@ 对应的接口类 %@ 的实现", protocolName, clsName];
        NSLog(@"%@",reason);
    }
}

- (void)assertForMoudleWithURL:(NSURL *)url {
    if (![self _clsForUrl:url]) {
        NSString *clsName = [url.scheme stringByAppendingString:MoudleProtocol_Suffix];
        NSString *reason = [NSString stringWithFormat: @"找不到协议 %@ 对应的接口类 %@ 的实现", url.scheme, clsName];
        NSLog(@"%@",reason);
    }
}

- (UIViewController *)findVcOfView:(UIView *) view {
    
    UIResponder *nextResponder =  view;
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

@end
