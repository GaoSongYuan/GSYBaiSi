//
//  GSYMeCell.m
//  GSY百思不得姐
//
//  Created by Song on 17/9/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeCell.h"

@implementation GSYMeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = [UIColor lightGrayColor];
        
        // 箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        // cell背景
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    //    self.textLabel.textColor = [UIColor lightGrayColor];
    
    if (self.imageView.image == nil) {
        return;
    }
    
    // imageView
    self.imageView.gsy_y = GSYSmallMargin;
//    self.imageView.gsy_x = GSYSmallMargin;
    self.imageView.gsy_height = self.contentView.gsy_height - 2*GSYSmallMargin;
    self.imageView.gsy_width = self.imageView.gsy_height;
    
    // textLabel
//    self.textLabel.gsy_x = self.imageView.gsy_right + GSYSmallMargin;
    self.textLabel.gsy_x = self.imageView.gsy_right + self.imageView.gsy_x;
    
}

@end
