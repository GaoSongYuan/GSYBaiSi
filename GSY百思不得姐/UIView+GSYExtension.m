//
//  UIView+GSYExtension.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "UIView+GSYExtension.h"

@implementation UIView (GSYExtension)

// size
-(CGSize)gsy_size {
    return self.frame.size;
}
-(void)setGsy_size:(CGSize)gsy_size {
    CGRect frame = self.frame;
    frame.size = gsy_size;
    self.frame = frame;
}


// width height
-(CGFloat)gsy_width {
    return self.frame.size.width;
}
-(void)setGsy_width:(CGFloat)gsy_width {
    CGRect frame = self.frame;
    frame.size.width = gsy_width;
    self.frame = frame;
}
-(CGFloat)gsy_height {
    return self.frame.size.height;
}
-(void)setGsy_height:(CGFloat)gsy_height {
    CGRect frame = self.frame;
    frame.size.height = gsy_height;
    self.frame = frame;
}


// x y
-(CGFloat)gsy_x {
    return self.frame.origin.x;
}
-(void)setGsy_x:(CGFloat)gsy_x {
    CGRect frame = self.frame;
    frame.origin.x = gsy_x;
    self.frame = frame;
}
-(CGFloat)gsy_y {
    return self.frame.origin.y;
}
-(void)setGsy_y:(CGFloat)gsy_y {
    CGRect frame = self.frame;
    frame.origin.y = gsy_y;
    self.frame = frame;
}


// center x y
-(CGFloat)gsy_centerX {
    return self.center.x;
}
-(void)setGsy_centerX:(CGFloat)gsy_centerX {
    CGPoint center = self.center;
    center.x = gsy_centerX;
    self.center = center;
}
-(CGFloat)gsy_centerY {
    return self.center.y;
}
-(void)setGsy_centerY:(CGFloat)gsy_centerY {
    CGPoint center = self.center;
    center.y = gsy_centerY;
    self.center = center;
}


// right bottom
-(CGFloat)gsy_right {
//    return self.gsy_x + self.gsy_width;
    return CGRectGetMaxX(self.frame);
}
-(void)setGsy_right:(CGFloat)gsy_right {
    self.gsy_x = gsy_right - self.gsy_width;
}
-(CGFloat)gsy_bottom {
    return CGRectGetMaxY(self.frame);
}
-(void)setGsy_bottom:(CGFloat)gsy_bottom {
    self.gsy_y = gsy_bottom - self.gsy_height;
}


@end
