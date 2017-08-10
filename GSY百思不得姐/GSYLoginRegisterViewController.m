//
//  GSYLoginRegisterViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYLoginRegisterViewController.h"

@interface GSYLoginRegisterViewController ()

@end

@implementation GSYLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

// 状态栏白色
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
