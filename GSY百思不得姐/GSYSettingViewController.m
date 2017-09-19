//
//  GSYSettingViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/12.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSettingViewController.h"
#import <SDWebImage/SDImageCache.h>
#import "GSYClearCacheCell.h"

@interface GSYSettingViewController ()

@end

@implementation GSYSettingViewController

static NSString * const GSYClearCacheCellId = @"GSYClearCacheCell";

-(instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    self.navigationItem.title = @"设置";
    
    // 注册
    [self.tableView registerClass:[GSYClearCacheCell class] forCellReuseIdentifier:GSYClearCacheCellId];
}

#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    // 1.确定重用标识
//    static NSString *ID = @"setting";
//    
//    // 2.从缓存池中取出
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    // 3.如果空就手动创建
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }

    // 取出cell
    GSYClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:GSYClearCacheCellId];

    // 返回cell
    return cell;
}

// 取消选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
