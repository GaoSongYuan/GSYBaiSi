//
//  GSYMeFooterView.m
//  GSY百思不得姐
//
//  Created by Song on 17/9/5.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeFooterView.h"
#import "GSYMeSquare.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SDWebImage/UIButton+WebCache.h>
#import "GSYMeSquareButton.h"

@implementation GSYMeFooterView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 请求
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        [session GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
            
            // 字典数组 -> 模型数组
            NSArray *squares = [GSYMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self creatSquares:squares];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败--");
        }];
    }
    return self;
}

// 根据模型数据创建对应的控件
-(void)creatSquares:(NSArray *)squares {
    
    // 方块个数
    NSUInteger count = squares.count;
    
    // 方块尺寸
    int maxColsCount = 4; // 一行的最大列数
    CGFloat buttonW = self.gsy_width / maxColsCount;
    CGFloat buttonH = buttonW;
    
    // 创建所有的方块
    for (NSUInteger i = 0; i<count ; i++) {
        
        // i 位置对应的模型数据
        GSYMeSquare *square = squares[i];
        
        // 创建按钮
        GSYMeSquareButton *button = [GSYMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        // 设置frame
        button.gsy_x = (i % maxColsCount) * buttonW;
        button.gsy_y = (i / maxColsCount) * buttonH;
        button.gsy_width = buttonW;
        button.gsy_height = buttonH; // 此处可以减去0.5，把底部灰色露出来，当做分割线
        
        // 设置数据
//        button.backgroundColor = GSYRandomColor;
        [button setTitle:square.name forState:UIControlStateNormal];
        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"publish-offline"]];
        button.backgroundColor = [UIColor whiteColor];
    }
    
    // footer高度
    self.gsy_height = self.subviews.lastObject.gsy_bottom;
//    self.gsy_height = (count / maxColsCount + 1) * buttonH;
    
    // footer重新赋给tableview
    UITableView *tableView = (UITableView *)self.superview;
    tableView.contentSize = CGSizeMake(0, self.gsy_bottom);
}

-(void)buttonClick:(GSYMeSquareButton *)button {
    NSLog(@"%@",button);
}


@end
