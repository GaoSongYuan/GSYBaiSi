//
//  GSYTabBarController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/1.
//  Copyright © 2017年 Song. All rights reserved.
//

// GSY GSY GSY GSY GSY GSY GSY

#import "GSYTabBarController.h"
#import "GSYTabBar.h"

@interface GSYTabBarController ()

@end

@implementation GSYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 选中状态下
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    
    // 添加子控制器
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupOneChildViewController:[[UITableViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    
#warning 更换tabBar ******
    /**** 更换tabbar ****/
    [self setValue:[[GSYTabBar alloc] init] forKey:@"tabBar"];
#warning 更换tabBar ******
}

-(void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.view.backgroundColor = GSYRandomColor;
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}


@end
