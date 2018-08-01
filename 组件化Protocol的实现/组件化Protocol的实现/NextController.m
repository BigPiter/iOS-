//
//  NextController.m
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "NextController.h"
#import "BaseDelegate.h"

@interface NextController ()<BaseDelegate>

@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.name;
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
