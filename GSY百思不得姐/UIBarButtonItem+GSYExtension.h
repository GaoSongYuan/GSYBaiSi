//
//  UIBarButtonItem+GSYExtension.h
//  GSY百思不得姐
//
//  Created by Song on 17/8/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GSYExtension)

// navigationItem按钮的设置
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

// 返回按钮的设置(自写)
+(instancetype)itemWithBackTarget:(id)target action:(SEL)action;

@end
