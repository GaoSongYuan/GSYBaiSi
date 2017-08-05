//
//  GSYFollowViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYFollowViewController.h"
#import "GSYRecommendFollowViewController.h"

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
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(leftClick)];
    
}

-(void)leftClick {
    GSYLogFunc;
    GSYRecommendFollowViewController *recommend = [[GSYRecommendFollowViewController alloc] init];
    [self.navigationController pushViewController:recommend animated:YES];
}

@end
