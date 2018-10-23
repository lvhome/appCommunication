//
//  ViewController.m
//  ProjectTwoDemo
//
//  Created by 吕洪建 on 2018/10/23.
//  Copyright © 2018年 吕洪建. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 300, 200);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick {
    NSLog(@"点击事件");
    //之前配置的白名单，就是需要跳转对方App的key，即对方设置的url
    NSString * UrlStr = @"ProjectDemo://index?a=b&b=c";
    //如果想传递参数 只要在index后面配置即可 ，同理打开其他的web一样传值
    NSURL * url = [NSURL URLWithString:UrlStr];
    // 在这里可以先做个判断
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        if (@available(iOS 10.0, *)) {//iOS 10之后
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }else{
        NSLog(@"尚未安装该应用");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
