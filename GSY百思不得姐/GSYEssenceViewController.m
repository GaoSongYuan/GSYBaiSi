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
#import "GSYAllViewController.h"
#import "GSYVideoViewController.h"
#import "GSYVoiceViewController.h"
#import "GSYPictureViewController.h"
#import "GSYWordViewController.h"

@interface GSYEssenceViewController () <UIScrollViewDelegate>

// 当前选中的按钮
@property(nonatomic,weak) GSYTitleButton *selectedTitleButton;
// 按钮底部指示器
@property(nonatomic,weak) UIView *indicatorView;
// UIScrollView
@property(nonatomic,weak) UIScrollView *scrollView;
// 标题栏
@property(nonatomic,weak) UIView *titleView;

@end

@implementation GSYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];// 背景色标题等 navgationBar
    [self setupChildViewControllers];// 添加子控制器
    [self setupScrollView];// 左右滑动的scrollview
    [self setupTitlesView];// 标签栏
    
    [self addChildVcView]; // 默认添加了一个子控制器的view（“全部”控制器）
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
    
    // 不允许自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = GSYRandomColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES; // 对scrollView进行分页
    scrollView.showsHorizontalScrollIndicator = NO; // 关闭水平滚动条的显示
    scrollView.showsVerticalScrollIndicator = NO; // 关闭垂直滚动条的显示
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.gsy_width, 0); // scrollView只能左右滑动，不能上下滑动，防止跟tableView冲突
    self.scrollView = scrollView;
    scrollView.delegate = self; // 代理
    [self.view addSubview:scrollView];
}

// 标签栏
-(void)setupTitlesView {
    // 设置标题
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7];
    titlesView.frame = CGRectMake(0, 64, self.view.gsy_width, 35);
    self.titleView = titlesView;
    [self.view addSubview:titlesView];
    
    // 添加标题
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titlesView.gsy_width / count;
    CGFloat titleButtonH = titlesView.gsy_height;
    for (NSUInteger i = 0; i < count; i++) {
        // 创建按钮
        GSYTitleButton *titleButton = [GSYTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        
        // 设置数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
    
    // 按钮的选中颜色
    GSYTitleButton *firstTitleButton = titlesView.subviews.firstObject;
    
    // 按钮底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.gsy_height = 2;
    indicatorView.gsy_y = titlesView.gsy_height - indicatorView.gsy_height;
    [titlesView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 立刻根据文字内容算出label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.gsy_width = firstTitleButton.titleLabel.gsy_width;
    indicatorView.gsy_centerX = firstTitleButton.gsy_centerX;  // 先算出第一个按钮下方的指示器，就不会出现动画，立刻会出现指示器
    
    // 默认情况：选中最前面的标题按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;  //    [self titleClick:firstTitleButton];
}

// 添加子控制器
-(void)setupChildViewControllers {
    GSYAllViewController *all = [[GSYAllViewController alloc] init];
    [self addChildViewController:all];
    GSYVideoViewController *video = [[GSYVideoViewController alloc] init];
    [self addChildViewController:video];
    GSYVoiceViewController *voice = [[GSYVoiceViewController alloc] init];
    [self addChildViewController:voice];
    GSYPictureViewController *picture = [[GSYPictureViewController alloc] init];
    [self addChildViewController:picture];
    GSYWordViewController *word = [[GSYWordViewController alloc] init];
    [self addChildViewController:word];
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
        self.indicatorView.gsy_width = titleButton.titleLabel.gsy_width;
        self.indicatorView.gsy_centerX = titleButton.gsy_centerX;
    }];
    
    // 让UIScrollView滚动到对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.gsy_width;
    [self.scrollView setContentOffset:offset animated:YES];
}

// navigationbar 左侧的菜单栏按钮点击事件
-(void)leftClick {
    GSYLogFunc;
}

#pragma mark - 添加子控制器的view
-(void)addChildVcView {
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.gsy_width;
    
    // 取出子控制器
    UIViewController *childVc = self.childViewControllers[index];
    
    if (childVc.view.superview) return; // 如果已经加载过一次，就直接返回
//    if (childVc.view.window) return; // 同上
//    if ([childVc isViewLoaded]) return; // 同上
    
//    childVc.view.gsy_y = 0;
//    childVc.view.gsy_x = index * self.scrollView.gsy_width;
//    childVc.view.gsy_width = self.scrollView.gsy_width;
//    childVc.view.gsy_height = self.scrollView.gsy_height;
    
//    childVc.view.gsy_x = self.scrollView.contentOffset.x;
//    childVc.view.gsy_y = self.scrollView.contentOffset.y;
//    childVc.view.gsy_width = self.scrollView.gsy_width;
//    childVc.view.gsy_height = self.scrollView.gsy_height;
    
//    childVc.view.gsy_x = self.scrollView.bounds.origin.x;
//    childVc.view.gsy_y = self.scrollView.bounds.origin.y;
//    childVc.view.gsy_width = self.scrollView.bounds.size.width;
//    childVc.view.gsy_height = self.scrollView.bounds.size.height;
    
    childVc.view.frame = self.scrollView.bounds;
    
    [self.scrollView addSubview:childVc.view];
}

#pragma mark - UIScrollViewDelegate
// 监听停止滚动
// 手动滑动停止滚动时：
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 选中/点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.gsy_width;
    GSYTitleButton *titleButton = self.titleView.subviews[index];
    [self titleClick:titleButton];
    
    // 添加子控制器
    [self addChildVcView];
}

// 自动滑动（即点击了按钮）停止滚动时：
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self addChildVcView];
}



@end
