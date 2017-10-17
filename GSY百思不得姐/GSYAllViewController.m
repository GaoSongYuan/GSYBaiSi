//
//  GSYAllViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/11.
//  Copyright © 2017年 Song. All rights reserved.
//
//  全部

#import "GSYAllViewController.h"
#import <AFNetworking.h>
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

@end

@implementation GSYAllViewController

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
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    
    // 请求 其中 responseObject是plist文件中的最大的字典
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
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
        NSLog(@"请求失败 - %@",error);
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *   上拉加载更多数据
 */
-(void)loadMoreTopics {
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
    
    // 请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
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
