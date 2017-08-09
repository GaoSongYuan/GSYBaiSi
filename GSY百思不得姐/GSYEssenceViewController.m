//
//  GSYEssenceViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYEssenceViewController.h"

@interface GSYEssenceViewController ()

@end

@implementation GSYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    GSYLogFunc;
    
    // 标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 左边
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftClick)];
    
}

-(void)leftClick {
    GSYLogFunc;
}



@end
