//
//  JTRouter.h
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JTRouter : NSObject
+ (instancetype) router;
- (id) interfaceForProtocol:(Protocol *) p;
- (id) interfaceForURL:(NSURL *) url;

// for unit test
- (void) assertForMoudleWithProtocol:(Protocol *) p;
- (void) assertForMoudleWithURL:(NSURL *) url;

// navi type for vc
// push present
- (UIViewController *)findVcOfView:(UIView *) view;
@end
