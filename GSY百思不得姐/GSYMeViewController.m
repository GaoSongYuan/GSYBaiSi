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
    
    self.view.backgroundColor = GSYRandomColor;
    GSYLogFunc;
    
    // 标题
    self.navigationItem.title = @"我的";
    
    // 左边设置
    UIButton *buttonSetting = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSetting setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [buttonSetting setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [buttonSetting addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonSetting sizeToFit];
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:buttonSetting];
    
    // 左边月亮
    UIButton *buttonMoon = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonMoon setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [buttonMoon setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    [buttonMoon addTarget:self action:@selector(moonClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonMoon sizeToFit];
    UIBarButtonItem *moonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonMoon];

    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

-(void)settingClick {
    GSYLogFunc;
}

-(void)moonClick {
    GSYLogFunc;
}

@end
