//
//  GSYNavigationController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYNavigationController.h"

@interface GSYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation GSYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // navigationbar 的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    // 手势pop
    self.interactivePopGestureRecognizer.delegate = self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        
        // 左上角返回按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button sizeToFit];
        
        // 内容的内边距（按钮左移）
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)back {
    [self popViewControllerAnimated:YES];
}


#pragma mark - 手势pop UIGestureRecognizerDelegate 代理
// 手势识别器对象 会调用这个代理方法来决定手势是否有效
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
//    if (self.childViewControllers.count == 1) {
//        return NO;
//    }
//    return YES;
    
    // 当导航控制器的子控制器个数 > 1 就有效
    return self.childViewControllers.count > 1 ;
}
@end
