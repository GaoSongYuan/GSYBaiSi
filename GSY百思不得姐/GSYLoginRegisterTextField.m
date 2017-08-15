//
//  GSYLoginRegisterTextField.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/15.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYLoginRegisterTextField.h"
//#import <objc/runtime.h>

static NSString * const GSYPlaceholderColorKey = @"_placeholderLabel.textColor";

@implementation GSYLoginRegisterTextField

-(void)awakeFromNib {
    [super awakeFromNib];
    // 光标颜色
    self.tintColor = [UIColor whiteColor];

#pragma 占位文字颜色设置1
//    // 占位文字颜色
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
    
#pragma 占位文字颜色设置2
//    // 利用runtime找出UITextField内部的成员变量
//    unsigned int count;
//    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
//    for (int i = 0; i<count; i++) {
//        Ivar ivar = ivarList[i];
//        NSLog(@"%s",ivar_getName(ivar));
//    }
//    free(ivarList);
    
    // 利用找出的成员变量中的_placeholderLabel，使用kvc，设置占位文字颜色
//    UILabel *label = [self valueForKeyPath:@"_placeholderLabel"];
//    label.textColor = [UIColor lightGrayColor];
    [self setValue:[UIColor lightGrayColor] forKeyPath:GSYPlaceholderColorKey];
}

@end
