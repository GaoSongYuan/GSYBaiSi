//
//  GSYClearCacheCell.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/19.
//  Copyright © 2017年 Song. All rights reserved.
//
//  清除缓存

#import "GSYClearCacheCell.h"
#import <SDWebImage/SDImageCache.h>
#import <SVProgressHUD.h>

#define GSYCustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"MP3"]

@implementation GSYClearCacheCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 设置cell右边的指示器（用来说明正在处理一些事情）
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        // 设置cell默认的文字
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        
        // 点击事件禁止掉(代码放置的顺序，会影响字的颜色)
        self.userInteractionEnabled = NO;
        
        __weak typeof(self) weakSelf = self;
        
        // 在子线程计算缓存大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            // 睡眠两秒
            [NSThread sleepForTimeInterval:2.0];
            
            // 获得缓存文件夹路径
            unsigned long long size = GSYCustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            
            // 如果cell已经销毁了，就直接返回
            if (weakSelf == nil) return;
            
            NSString *sizeText = nil;
            if (size >= 1000 * 1000 * 1000) { // size >= 1GB  pow(10, 9) 10的9次方
                sizeText = [NSString stringWithFormat:@"%.1fGB",size / 1000.0 / 1000.0 / 1000.0];
            }else if (size >= 1000 * 1000) { // 1GB > size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.1fMB",size / 1000.0 / 1000.0];
            }else if (size >= 1000) { // 1MB > size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.1fKB",size / 1000.0];
            }else { // 1KB > size
                sizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            
            // 生成文字
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",sizeText];
            
            // 回到主线程设置文字
            dispatch_async(dispatch_get_main_queue(), ^{ // block内部是通过弱引用，去引用外面的一个对象的话，block内部就不会对那个对象产生强引用
                // 设置文字
                weakSelf.textLabel.text = text;
                // 清空右边的指示器
                weakSelf.accessoryView = nil;
                // 设置右边箭头
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 箭头
                
                // 给cell添加手势监听器
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(clearCache_GSY)]];
                
                // 恢复点击事件
                weakSelf.userInteractionEnabled = YES;
            });
        });
    }
    return self;
}

// 清除缓存
-(void)clearCache_GSY {
    // 弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack]; // 灰色蒙版
    
    // 删除缓存文件
    // 删除SDWebImage缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        // 删除自定义缓存
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:GSYCustomCacheFile error:nil];
            [mgr createDirectoryAtPath:GSYCustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
            
            // 睡眠两秒
            [NSThread sleepForTimeInterval:2.0];
            
            // 回到主线程 - 所有的缓存都清除完毕
            dispatch_async(dispatch_get_main_queue(), ^{
                // 隐藏指示器
                [SVProgressHUD dismiss];
                
                // 重新设置文字
                self.textLabel.text = @"清除缓存(0B)";
            });
        });
    }];
}

@end
