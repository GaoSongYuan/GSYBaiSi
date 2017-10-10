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
        titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        // 设置数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        
        // 设置按钮颜色
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
}

#pragma mark - 监听点击
// 标题栏的点击事件
-(void)titleClick:(GSYTitleButton *) titleButton {
    // 控制按钮状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    
//    [self.selectedTitleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    self.selectedTitleButton = titleButton;
    GSYLogFunc
}

// navigationbar 左侧的菜单栏按钮点击事件
-(void)leftClick {
    GSYLogFunc;
}
@end
