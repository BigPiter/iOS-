//
//  ModuleJT.m
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "ModuleAJT.h"
#import "NextController.h"

@implementation ModuleAJT

@synthesize callback;
@synthesize name;
@synthesize serverBody;
@synthesize params;

- (UIViewController *)serverBody {
    if (!serverBody) {
        NextController *nextVC = [[NextController alloc] init];
        nextVC.name = name;
        serverBody = nextVC;
        callback(name);
    }
    return serverBody;
}

//- (void)setCallback:(void (^)(id))callback {
//    if (callback) {
//        callback(name);
//    }
//}

@end
