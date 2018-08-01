//
//  UploadJT.m
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "UploadJT.h"

@implementation UploadJT
@synthesize serverBody;
@synthesize params;
@synthesize callback;

- (void)uploadImage:(UIImage *)image paramers:(NSDictionary *)dic {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(dic);
    });
}

@end
