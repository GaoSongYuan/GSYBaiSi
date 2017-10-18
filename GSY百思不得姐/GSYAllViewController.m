//
//  GSYAllViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/11.
//  Copyright © 2017年 Song. All rights reserved.
//
//  全部

#import "GSYAllViewController.h"
#import "GSYHTTPSessionManager.h"
//#import <AFNetworking.h>
#import "XMGTopic.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
//#import <MJRefresh.h>
#import "GSYRefreshHeader.h"
#import "GSYRefreshFooter.h"

@interface GSYAllViewController ()

/** 所有的帖子数据 **/
@property(nonatomic,strong) NSMutableArray<XMGTopic *> *topics;
/** 下拉刷新的提示文字 **/
@property(nonatomic,weak) UILabel *label;
/** maxtime : 用来加载下一页数据 **/
@property(nonatomic,copy) NSString *maxtime;
/** 任务管理者 **/
@property(nonatomic,strong) GSYHTTPSessionManager *manager; // 下拉和上拉都用同一个manager，统一管理

@end

@implementation GSYAllViewController

-(GSYHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [GSYHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // tableView的调整
    self.tableView.contentInset = UIEdgeInsetsMake(64+35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset; // 滚动条
    
    [self setupRefresh];
}

// 下拉刷新
-(void)setupRefresh {
    
    // 下拉刷新
    self.tableView.mj_header = [GSYRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 一进入界面就刷新
    [self.tableView.mj_header beginRefreshing];
    
    // 上拉加载更多数据
    self.tableView.mj_footer = [GSYRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - 加载最新的帖子数据
/**
 *   下拉加载最新数据
 */
-(void)loadNewTopics {
    
    // 取消其他请求
    // self.manager.tasks 数组中装着manager的所有任务
    // 让数组中的所有对象，都执行 cancel 方法
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)]; // 当任务被取消，会来到 failure这个block，会进行 结束刷新 的代码
    
//    for (NSURLSessionTask *task in self.manager.tasks) {
//        [task cancel];
//    }
    
//    [self.manager invalidateSessionCancelingTasks:YES]; // 取消所有任务 + 关闭NSURLSession
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    
    // 请求 其中 responseObject是plist文件中的最大的字典
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 存储maxtime（方便用来加载下一页数据）
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 一个数组，里面放着模型
        // 将list这个字典数组 转成 装着模型的模型数组
        NSArray *topics = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]; // 从responseObject这个大的字典里面，通过key-list取出
        self.topics = (NSMutableArray *)topics;
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == NSURLErrorCancelled) { // 错误代码：-999
            NSLog(@"请求失败原因：取消了");
        }else {
            NSLog(@"请求失败 - %ld",error.code);
        }
        NSLog(@"请求失败 - %@",error);
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *   上拉加载更多数据
 */
-(void)loadMoreTopics {
    
    // 取消其他请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)]; // 让请求停止
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
    
    // 请求
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 存储maxtime（方便用来加载下一页数据）
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        NSArray *moreTopics = [XMGTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:moreTopics];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败 - %@",error);
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 服务器返回多少个帖子，这里就有多少行cell
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.确定重用标识
    static NSString *ID = @"cell";
    // 2.从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = GSYRandomColor;
    }
    
    // 4.显示数据
    XMGTopic *topic = self.topics[indexPath.row]; // 取出模型
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}


@end
