//
//  UIBarButtonItem+GSYExtension.h
//  GSY百思不得姐
//
//  Created by Song on 17/8/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GSYExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
