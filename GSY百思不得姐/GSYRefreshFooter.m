//
//  GSYRefreshFooter.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/17.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYRefreshFooter.h"

@implementation GSYRefreshFooter

/**
 *   初始化
 */
-(void)prepare {
    [super prepare];
    
    self.stateLabel.textColor = [UIColor redColor];
    
    [self setTitle:@"GSY上拉加载更多数据" forState:MJRefreshStateIdle];
    [self setTitle:@"GSY正在加载" forState:MJRefreshStateRefreshing];
    
    // 按照百分比出现的cell，刷新。默认是 1.0 - 百分百出现后刷新
//    self.triggerAutomaticallyRefreshPercent = 0.5;
    
    // 取消自动刷新
    self.automaticallyRefresh = NO;
    
}

@end
