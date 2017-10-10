//
//  GSYTitleButton.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTitleButton.h"

@implementation GSYTitleButton

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置按钮颜色
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        // 设置按钮字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}


-(void)setHighlighted:(BOOL)highlighted {
    
}

@end
