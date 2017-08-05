//
//  GSYTabBar.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/2.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTabBar.h"

@interface GSYTabBar()
@property(nonatomic,weak) UIButton *publishButton;
@end

@implementation GSYTabBar

#pragma mark - 懒加载
-(UIButton *)publishButton {
    if (!_publishButton) {
        /**** 添加中间的发布按钮 ****/
        // 创建中间的发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        // 点击事件
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return _publishButton;
}

#warning 初始化。设置layout
#pragma mark - 初始化。设置layout
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    }
    return self;
}
#warning 初始化。设置layout

-(void)layoutSubviews {
    [super layoutSubviews];
    
//    CGFloat buttonW = self.frame.size.width / 5;
//    CGFloat buttonH = self.frame.size.height;
//    CGFloat buttonY = 0;

    CGFloat buttonW = self.gsy_width / 5; // 使用扩展，拿到宽度高度
    CGFloat buttonH = self.gsy_height;
    CGFloat buttonY = 0;
    
    // 索引
    CGFloat index = 0;
    
    for (UIView *subview in self.subviews) {
        
#warning Find - UITabBarButton
        // 过滤掉非UITabBarButton,找到四个按钮
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
#warning Find - UITabBarButton
        
        // 设置frame
        CGFloat buttonX = index * buttonW;
        if (index >= 2) {
            buttonX += buttonW;
        }
        subview.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
    
    /**** 设置中间的发布按钮的 frame ****/
//    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
//    self.publishButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    self.publishButton.gsy_width = buttonW;
    self.publishButton.gsy_height = buttonH;
    self.publishButton.gsy_centerX = self.gsy_width * 0.5;
    self.publishButton.gsy_centerY = self.gsy_height * 0.5; // 使用扩展，设置宽高中心点
}

-(void)publishClick {
    GSYLog(@"publish -- click");
}

@end
