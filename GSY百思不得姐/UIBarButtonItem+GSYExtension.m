//
//  UIBarButtonItem+GSYExtension.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "UIBarButtonItem+GSYExtension.h"

@implementation UIBarButtonItem (GSYExtension)

// navigationItem按钮的设置
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

@end
