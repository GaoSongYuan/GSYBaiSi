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

// 返回按钮的设置(自写)
+(instancetype)itemWithBackTarget:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    // 内容的内边距,同理有：
    //    图片的内边距：button.imageEdgeInsets
    //    文字的内边距：button.titleEdgeInsets
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0); // 需要在sizeToFit后面
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
