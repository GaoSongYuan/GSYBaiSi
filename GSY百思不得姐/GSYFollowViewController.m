//
//  GSYFollowViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYFollowViewController.h"

@interface GSYFollowViewController ()

@end

@implementation GSYFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYRandomColor;
    GSYLogFunc;
    
    // 标题
    self.navigationItem.title = @"我的关注";
    
    // 左边
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

-(void)leftClick {
    GSYLogFunc;
}

@end
