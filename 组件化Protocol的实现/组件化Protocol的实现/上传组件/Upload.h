//
//  Upload.h
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDelegate.h"

@protocol Upload <BaseDelegate>

- (void)uploadImage:(UIImage*)image paramers:(NSDictionary *)dic;

@end
