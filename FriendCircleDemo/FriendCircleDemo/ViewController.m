//
//  ViewController.m
//  FriendCircleDemo
//
//  Created by 朱伟阁 on 2019/3/28.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "ViewController.h"
#import "FriendCircleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"进入朋友圈" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(goFriendCircle) forControlEvents:UIControlEventTouchUpInside];
}

- (void)goFriendCircle{
    FriendCircleViewController *friendcircle = [[FriendCircleViewController alloc]init];
    [self presentViewController:friendcircle animated:YES completion:nil];
}

@end
