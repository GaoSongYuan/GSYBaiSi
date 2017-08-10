//
//  GSYFollowViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYFollowViewController.h"
#import "GSYRecommendFollowViewController.h"
#import "GSYLoginRegisterViewController.h"

@interface GSYFollowViewController ()

@end

@implementation GSYFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    GSYLogFunc;
    
    // 标题
    self.navigationItem.title = @"我的关注";
    
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(leftClick)];
    
}

-(void)leftClick {
    GSYLogFunc;
    GSYRecommendFollowViewController *recommend = [[GSYRecommendFollowViewController alloc] init];
    [self.navigationController pushViewController:recommend animated:YES];
}

// 登录注册
- (IBAction)loginOrRegister {
    GSYLoginRegisterViewController *loginRegister = [[GSYLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegister animated:YES completion:nil];
}

@end
