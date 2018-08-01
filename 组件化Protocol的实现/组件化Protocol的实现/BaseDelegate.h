//
//  BaseDelegate.h
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseDelegate <NSObject>

@required
@optional

@property (nonatomic, strong) __kindof UIViewController *serverBody;
@property (nonatomic, strong) id params;

@property(nonatomic, copy) void (^callback) (id params);
@end

