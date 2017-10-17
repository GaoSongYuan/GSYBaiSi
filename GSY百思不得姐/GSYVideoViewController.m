//
//  GSYVideoViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/11.
//  Copyright © 2017年 Song. All rights reserved.
//
//  视频

#import "GSYVideoViewController.h"
//#import "GSYRefreshHeader.h"

@interface GSYVideoViewController ()

@end

@implementation GSYVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // tableView的调整
    self.tableView.contentInset = UIEdgeInsetsMake(64+35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset; // 滚动条
    
//    self.tableView.mj_header = [GSYRefreshHeader headerWithRefreshingBlock:^{
//        GSYLogFunc;
//    }];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = self.view.backgroundColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd",[self class],indexPath.row];
    return cell;
}

@end
