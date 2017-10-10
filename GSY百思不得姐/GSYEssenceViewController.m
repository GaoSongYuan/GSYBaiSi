//
//  GSYEssenceViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//
//  首页 - 精华

#import "GSYEssenceViewController.h"
#import "GSYTitleButton.h"

@interface GSYEssenceViewController ()
// 当前选中的按钮
@property(nonatomic,weak) GSYTitleButton *selectedTitleButton;

// 按钮底部指示器
@property(nonatomic,weak) UIView *indicatorView;
@end

@implementation GSYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupScrollView];
    [self setupTitlesView];
}

// 背景色标题等 navgationBar
-(void)setupNav {
    self.view.backgroundColor = GSYCommonBgColor;
    // 标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // navgationBar 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftClick)];
}

// 左右滑动的scrollview
-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}

// 标签栏
-(void)setupTitlesView {
    // 设置标题
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4];
    titlesView.frame = CGRectMake(0, 64, self.view.gsy_width, 35);
    [self.view addSubview:titlesView];
    
    // 添加标题
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titlesView.gsy_width / count;
    CGFloat titleButtonH = titlesView.gsy_height;
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        GSYTitleButton *titleButton = [GSYTitleButton buttonWithType:UIButtonTypeCustom];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        // 设置数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
    
    // 按钮的选中颜色
    GSYTitleButton *lastTitleButton = titlesView.subviews.lastObject;
    
    // 按钮底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [lastTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.gsy_height = 2;
    indicatorView.gsy_y = titlesView.gsy_height - indicatorView.gsy_height;
    [titlesView addSubview:indicatorView];
    self.indicatorView = indicatorView;
}

#pragma mark - 监听点击
// 标题栏的点击事件
-(void)titleClick:(GSYTitleButton *) titleButton {
    // 控制按钮状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;

    // 按钮底部指示器
    [UIView animateWithDuration:0.25 animations:^{
//        // 计算文字宽度
//        CGFloat titleW = [titleButton.currentTitle sizeWithAttributes:@{NSFontAttributeName : titleButton.titleLabel.font}].width;
        
        self.indicatorView.gsy_width = titleButton.titleLabel.gsy_width;
        self.indicatorView.gsy_centerX = titleButton.gsy_centerX;
    }];
    
    GSYLogFunc
}

// navigationbar 左侧的菜单栏按钮点击事件
-(void)leftClick {
    GSYLogFunc;
}
@end
