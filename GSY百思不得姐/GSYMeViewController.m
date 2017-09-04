//
//  GSYMeViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/4.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMeViewController.h"

@interface GSYMeViewController ()

@end

@implementation GSYMeViewController

-(instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionFooterHeight = 0;
    
//    // 单独使用下面三行，不需配合hight代理方法 也可以设置均分间隔
//    self.tableView.sectionHeaderHeight = 0;
//    self.tableView.sectionFooterHeight = 10;
//    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    self.view.backgroundColor = GSYCommonBgColor;
    GSYLogFunc;
    
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
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.确定重用标识
    static NSString *ID = @"cell";
    
    // 2.从缓存池中取出
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.section];
    return cell;
}

#pragma mark - 代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 200;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 10)];
//    foot.backgroundColor = [UIColor redColor];
//    return foot;
//}

@end
