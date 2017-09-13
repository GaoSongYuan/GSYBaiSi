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
#import "GSYMeSquareButton.h"
#import "GSYWebViewController.h"
//#import <SafariServices/SafariServices.h>

@interface GSYMeFooterView()

// 存放所有模型的字典
//@property(nonatomic,strong) NSMutableDictionary<NSString *,GSYMeSquare *> *allSquares;

@end

@implementation GSYMeFooterView

// 懒加载
//-(NSMutableDictionary<NSString *,GSYMeSquare *> *)allSquares {
//    if (!_allSquares) {
//        _allSquares = [NSMutableDictionary dictionary];
//    }
//    return _allSquares;
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

    // 创建所有的方块
    for (NSUInteger i = 0; i<count ; i++) {
        
//        // i 位置对应的模型数据
//        GSYMeSquare *square = squares[i];
    
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
        button.square = squares[i];
        
        // 利用方块的名字作为key，存储方块模型。
        // 通过名字，就能取出模型。
//        self.allSquares[button.currentTitle] = square;
    }
    
    // 总行数
    // 万能公式： NSUInteger rowsCount = (总数 + 每一行最多显示的数量 - 1) / 每一行最多显示的数量;
    NSUInteger rowsCount = (count + maxColsCount - 1) / maxColsCount;
    
    // footer高度 == 最后一个按钮的bottom（最大Y值）
//    self.gsy_height = self.subviews.lastObject.gsy_bottom;
    self.gsy_height = rowsCount *buttonH;
    
    // footer重新赋给tableview 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据（其实也会重新计算contentSize）
}

// footera按钮点击事件
-(void)buttonClick:(GSYMeSquareButton *)button {
    
    // 取出模型
//    GSYMeSquare *square = self.allSquares[button.currentTitle];

//    [@"mod://asdhttpasd" containsString:@"http"];   YES;  包含
//    [@"mod://asdhttpasd" hasSuffix:@"sd"];  YES;  后缀
//    [@"mod://asdhttpasd" hasPrefix:@"http"];  NO;  前缀
    
    NSString *url = button.square.url;
    if ([url hasPrefix:@"http"]) { // 利用webView加载URL即可
        
//        // 使用SFSafariViewController加载Safari网页
//        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
//        [tabBarVc presentViewController:webView animated:YES completion:nil]; // modal 出Safari形式的webView
        
        // 显示GSYWebViewController
        GSYWebViewController *webView = [[GSYWebViewController alloc] init];
        webView.url = url;
        webView.navigationItem.title = button.currentTitle;
        
        // 获得“我”模块对应的导航控制器
        UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = tabBarVc.selectedViewController; // 选中的控制器
        [nav pushViewController:webView animated:YES];
        
    } else if ([url hasPrefix:@"mod"]) {
        NSLog(@"mod");
    } else {
        NSLog(@"不是http或者mod协议");
    }
    
}


@end
