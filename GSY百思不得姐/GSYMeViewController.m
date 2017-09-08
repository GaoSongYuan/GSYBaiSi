//
//  GSYMeViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeViewController.h"
#import "GSYMeCell.h"
#import "GSYMeFooterView.h"

@interface GSYMeViewController ()

@end

@implementation GSYMeViewController

-(instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTable];
    [self setupNav];
}

// 设置tableView
-(void)setupTable {
    self.view.backgroundColor = GSYCommonBgColor;
    // 单独使用下面三行，不需配合hight代理方法 也可以设置均分间隔
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = GSYMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(GSYMargin-35, 0, 0, 0);
    
    // 设置footerView
    self.tableView.tableFooterView = [[GSYMeFooterView alloc] init];
}

// 设置导航栏
-(void)setupNav {
    // 标题
    self.navigationItem.title = @"我的";
    
    // 左边设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    // 左边月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

-(void)settingClick {
    GSYLogFunc;
}

-(void)moonClick {
    GSYLogFunc;
}

#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.确定重用标识
    static NSString *ID = @"cell";
    
    // 2.从缓存池中取出
    GSYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[GSYMeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 4.设置数据
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    } else {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    
    return cell;
}

#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;
}

@end
