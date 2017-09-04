//
//  UITextField+GSYExtension.m
//  GSY百思不得姐
//
//  Created by Song on 17/9/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "UITextField+GSYExtension.h"

static NSString * const GSYPlaceholderColorKey = @"_placeholderLabel.textColor";

@implementation UITextField (GSYExtension)

// set方法
-(void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    // 容错处理：使设置占位文字与其颜色的顺序不会产生影响
    NSString *oldPlaceHolder = self.placeholder;
    self.placeholder = @" "; // 需要提前设置占位文字，目的：让他提前创建placeholderLabel
    self.placeholder = oldPlaceHolder;
    
    [self setValue:placeholderColor forKeyPath:GSYPlaceholderColorKey];
}

// get方法
-(UIColor *)placeholderColor {
    return [self valueForKeyPath:GSYPlaceholderColorKey];
}

@end
