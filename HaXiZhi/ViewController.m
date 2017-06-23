//
//  ViewController.m
//  HaXiZhi
//
//  Created by 王盛魁 on 16/7/14.
//  Copyright © 2016年 WangShengKui. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Algorithm.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *ceshiString = @"ceshi--中文";
    NSLog(@"哈希值算法 == %@  ----- %@",ceshiString,[NSString sha1:ceshiString]);
    NSLog(@"MD5      == %@  ----- %@",ceshiString,[NSString md5:ceshiString]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
