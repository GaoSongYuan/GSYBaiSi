//
//  GSYQuickLoginButton.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYQuickLoginButton.h"

@implementation GSYQuickLoginButton

-(void)awakeFromNib {
    [super awakeFromNib];
    
    // 文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 图片
    self.imageView.gsy_centerX = self.gsy_width * 0.5;
    self.imageView.gsy_y = 0;
    
    // 文字
    self.titleLabel.gsy_x = 0;
    self.titleLabel.gsy_y = self.imageView.gsy_bottom;
    self.titleLabel.gsy_width = self.gsy_width;
    self.titleLabel.gsy_height = self.gsy_height - self.self.imageView.gsy_height;
    
}

@end
