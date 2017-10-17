//
//  GSYRefreshHeader.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/17.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYRefreshHeader.h"

@interface GSYRefreshHeader()

/** logo **/
@property(nonatomic,weak) UIImageView *logo;

@end

@implementation GSYRefreshHeader


/**
 *   初始化
 */
-(void)prepare {
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor redColor]; // 时间颜色
    self.stateLabel.textColor = [UIColor blueColor]; // 提示文字颜色
    
    [self setTitle:@"GSY下拉刷新111" forState:MJRefreshStateIdle]; // 改变刷新状态的文字
    [self setTitle:@"GSY松手刷新222" forState:MJRefreshStatePulling];
    [self setTitle:@"GSY正在刷新333" forState:MJRefreshStateRefreshing];
    
//    self.lastUpdatedTimeLabel.hidden = YES; // 隐藏时间
//    self.stateLabel.hidden = YES;
//    [self addSubview:[[UISwitch alloc] init]];
    
    
    // 图片logo
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"googlelogo_color_272x92dp"]; // MainTitle  googlelogo_color_272x92dp
    [self addSubview:logo];
    self.logo = logo;
}

/**
 *   摆放子控件
 */
-(void)placeSubviews {
    [super placeSubviews];
    
    self.logo.gsy_width = self.gsy_width;
    self.logo.gsy_height = 80;
    self.logo.gsy_x = 0;
    self.logo.gsy_y = -80;
    
}

@end
