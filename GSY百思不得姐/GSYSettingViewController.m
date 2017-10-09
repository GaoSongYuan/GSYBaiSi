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
#import "GSYSettingOtherCell.h"

@interface GSYSettingViewController ()

@end

@implementation GSYSettingViewController

static NSString * const GSYClearCacheCellId = @"GSYClearCacheCell";
static NSString * const GSYSettingOtherCellId = @"GSYSettingOtherCell";

-(instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    self.navigationItem.title = @"设置";
    
    // 注册
    [self.tableView registerClass:[GSYClearCacheCell class] forCellReuseIdentifier:GSYClearCacheCellId];
    [self.tableView registerClass:[GSYSettingOtherCell class] forCellReuseIdentifier:GSYSettingOtherCellId];
}

#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:GSYClearCacheCellId];
    } else {
        GSYSettingOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:GSYSettingOtherCellId];
        if (indexPath.row == 1) {
            cell.textLabel.text = @"indexPath.row == 1";
        }
        return cell;
    }
    
}

#pragma mark - 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 取消选中
    GSYLogFunc;
}

@end
