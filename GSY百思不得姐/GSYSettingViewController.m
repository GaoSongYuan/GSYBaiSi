//
//  GSYSettingViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/12.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSettingViewController.h"
#import <SDWebImage/SDImageCache.h>

@interface GSYSettingViewController ()

@end

@implementation GSYSettingViewController

-(instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GSYCommonBgColor;
    self.navigationItem.title = @"设置";
    
    // 利用SDWebImage计算缓存大小
//    NSLog(@"%zd",[SDImageCache sharedImageCache].getSize);
    
    NSLog(@"%zd",@"/Users/song/Desktop/ps12-21/jc1502031_2a.jpg".fileSize);
}

#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.确定重用标识
    static NSString *ID = @"setting";
    
    // 2.从缓存池中取出
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"清除缓存";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 箭头
    return cell;
}

// 取消选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
