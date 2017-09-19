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
    
//    NSLog(@"%@",NSHomeDirectory());
    
    // 利用SDWebImage计算缓存大小
//    NSLog(@"%zd",[SDImageCache sharedImageCache].getSize);
    
//    NSLog(@"%zd",@"/Users/song/Desktop/ps12-21/jc1502031_2a.jpg".fileSize);
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
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 箭头
    
    // 设置cell右边的指示器（用来说明正在处理一些事情）
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [loadingView startAnimating];
    cell.accessoryView = loadingView;
    
    // 设置cell默认的文字
    cell.textLabel.text = @"清除缓存(正在计算缓存大小...)";
    
    // 获得缓存文件夹路径
    // 在子线程计算缓存大小
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
//        NSString *dirpath = [cachesPath stringByAppendingPathComponent:@"default"];
        unsigned long long size = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"MP3"].fileSize;
        size += [SDImageCache sharedImageCache].getSize;
        
        // 生成文字
        NSString *text = [NSString stringWithFormat:@"清除缓存(%zdB)",size];
    
        // 回到主线程设置文字
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置文字
            cell.textLabel.text = text;
            // 清空右边的指示器
            cell.accessoryView = nil;
            // 设置右边箭头
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 箭头
        });
    });
    
    return cell;
}

// 取消选中
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
