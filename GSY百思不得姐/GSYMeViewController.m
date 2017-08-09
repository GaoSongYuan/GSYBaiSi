//
//  GSYMeViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeViewController.h"

@interface GSYMeViewController ()

@end

@implementation GSYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    GSYLogFunc;
    
    // 标题
    self.navigationItem.title = @"我的";
    
    // 左边设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    // 左边月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];

    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

-(void)settingClick {
    GSYLogFunc;
}

-(void)moonClick {
    GSYLogFunc;
}

@end
