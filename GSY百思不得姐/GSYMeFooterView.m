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

@interface GSYMeFooterView()

// 存放所有模型的字典
@property(nonatomic,strong) NSMutableDictionary<NSString *,GSYMeSquare *> *allSquares;

// 过滤后的模型字典
//@property(nonatomic,strong) NSMutableDictionary<NSString *,GSYMeSquare *> *lastSquares;

@end

@implementation GSYMeFooterView

// 懒加载
-(NSMutableDictionary<NSString *,GSYMeSquare *> *)allSquares {
    if (!_allSquares) {
        _allSquares = [NSMutableDictionary dictionary];
    }
    return _allSquares;
}
//-(NSMutableDictionary<NSString *,GSYMeSquare *> *)lastSquares {
//    if (!_lastSquares) {
//        _lastSquares = [NSMutableDictionary dictionary];
//    }
//    return _lastSquares;
//}

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
            
//            NSLog(@"%@",squares);
            
            [self creatSquares:squares]; // 模型数组
            
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
    
//    GSYMeSquare *GSYsquare;
//    for (NSUInteger a = 0; a<count; a++) {
//        GSYsquare = squares[a];
//        
//        // 利用方块的名字作为key，存储方块模型。
//        // 通过名字，就能取出模型。
//        self.lastSquares[GSYsquare.name] = GSYsquare;
//    }
    
//    NSString *title;
//    for (title in [self.lastSquares allKeys]) {
////        NSLog(@"%@",self.lastSquares[title]);
//        GSYsquare = self.lastSquares[title];
//        NSLog(@"%@",GSYsquare);
//    }
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    for (NSString *name in self.lastSquares) {
//        [dict setObject:name forKey:name];
//    }
//    NSLog(@"%@",[dict allValues]);
    

//    NSSet *set = [NSSet setWithObject:self.lastSquares[GSYsquare.name]];
//    NSLog(@"%@",[set allObjects]);

//    NSLog(@"%lu",(unsigned long)count); // 42
//    NSLog(@"%lu",(unsigned long)self.lastSquares.count); // 35
    // 创建所有的方块
    for (NSUInteger i = 0; i<count ; i++) {
        
        // i 位置对应的模型数据
        GSYMeSquare *square = squares[i];
        
        // 利用方块的名字作为key，存储方块模型。
        // 通过名字，就能取出模型。
        self.allSquares[square.name] = square;
        
//        // 全部的的模型放入 GSYsquare
//        for (NSUInteger a = 0; a<count; a++) {
//            GSYsquare = squares[a];
//            
//            if (GSYsquare.name) {
//                squares[a] = squares[a+1]
//            }
//        }
//        NSLog(@"%@",GSYsquare.name);
//        NSLog(@"-- --");
//        NSLog(@"%@",square.name);
    
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
        [button setTitle:square.name forState:UIControlStateNormal];
        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"publish-offline"]];
    }
    
    // footer高度 == 最后一个按钮的bottom（最大Y值）
    self.gsy_height = self.subviews.lastObject.gsy_bottom;
    
    // footer重新赋给tableview 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据（其实也会重新计算contentSize）
}

// footera按钮点击事件
-(void)buttonClick:(GSYMeSquareButton *)button {
    
    // 取出模型
    GSYMeSquare *square = self.allSquares[button.currentTitle];
    
    GSYLog(@"%@",square.url);

}


@end
