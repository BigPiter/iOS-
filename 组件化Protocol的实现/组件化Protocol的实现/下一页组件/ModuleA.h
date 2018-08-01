//
//  ModuleADelegate.h
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "BaseDelegate.h"

@protocol ModuleA <BaseDelegate>
@required
@property(nonatomic, strong) NSString *name;
@end
