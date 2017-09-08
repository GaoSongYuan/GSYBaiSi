//
//  GSYMeSquareButton.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/7.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeSquareButton.h"

@implementation GSYMeSquareButton

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter; // 文字居中
        self.titleLabel.font = [UIFont systemFontOfSize:13]; // 文字大小
//        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return self;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 设置图片的大小位置
    self.imageView.gsy_y = self.gsy_height * 0.1;
    self.imageView.gsy_height = self.gsy_height * 0.5;
    self.imageView.gsy_width = self.imageView.gsy_height;
    self.imageView.gsy_centerX = self.gsy_width * 0.5;
    
    // 设置名称的位置大小
    self.titleLabel.gsy_x = 0;
    self.titleLabel.gsy_y = self.imageView.gsy_bottom;
    self.titleLabel.gsy_width = self.gsy_width;
    self.titleLabel.gsy_height = self.gsy_height - self.imageView.gsy_height - 10;
    self.titleLabel.textColor = [UIColor blackColor];
    
}

@end
