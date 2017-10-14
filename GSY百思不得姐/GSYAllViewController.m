//
//  GSYAllViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/11.
//  Copyright © 2017年 Song. All rights reserved.
//
//  全部

#import "GSYAllViewController.h"

@interface GSYAllViewController ()

@end

@implementation GSYAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GSYLogFunc;
    
    // tableView的调整
    self.tableView.contentInset = UIEdgeInsetsMake(64+35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset; // 滚动条
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
        cell.backgroundColor = GSYRandomColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd",[self class],indexPath.row];
    return cell;
}

@end
