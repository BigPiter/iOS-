//
//  ViewController.m
//  组件化Protocol的实现
//
//  Created by ZhangJitao on 2018/8/1.
//  Copyright © 2018年 Piter Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ModuleA.h"
#import "Upload.h"
#import "JTRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickNext:(id)sender {
    
//    id <Upload> obj = [[JTRouter router] interfaceForURL:[NSURL URLWithString:@"Upload://?name=xiaobaitu&tid=2018"]];
//    [obj uploadImage:[UIImage imageNamed:@"haha"] paramers:@{@"tid":@"001"}];
    
    id <ModuleA> obj = [[JTRouter router] interfaceForProtocol:@protocol(ModuleA)];
    obj.name = @"小白兔";
    [obj setCallback:^(id params) {
        NSLog(@"params = %@",params);
    }];
    [self.navigationController pushViewController:[obj serverBody] animated:nil];
}
- (IBAction)uploadAction:(id)sender {
    id <Upload> obj = [[JTRouter router] interfaceForProtocol:@protocol(Upload)];
    [obj uploadImage:[UIImage imageNamed:@"haha"] paramers:@{@"tid":@"001"}];
    
    [obj setCallback:^(id params) {
        NSLog(@"params = %@",params);
    }];
}

@end
