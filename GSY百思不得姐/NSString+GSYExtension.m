//
//  NSString+GSYExtension.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/13.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "NSString+GSYExtension.h"

@implementation NSString (GSYExtension)

#pragma mark - 方法一
//-(unsigned long long)fileSize {
//
//    // 总大小
//    unsigned long long size = 0;
//    
//    // 文件管理者
//    NSFileManager *mgr = [NSFileManager defaultManager];
//    
//    // 先把文件属性提出来
//    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
//    
//    // 判断文件夹还是文件
//    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) { // 文件夹
//        // 获得文件夹的大小 == 文件夹中所有文件的大小之和
//        // Enumerator ： 遍历器/迭代器
//        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self]; // 目前只是获取文件夹中文件的大小，而不是文件本身的大小
//        for (NSString *subpath in enumerator) {
//            // 全路径 拼接
//            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
//            // 文件的属性（不是文件夹！）
//            NSDictionary *attrs = [mgr attributesOfItemAtPath:fullSubpath error:nil];
//            // 累加文件大小
//            size += attrs.fileSize;
//        }
//    } else { // 文件
//        size += attrs.fileSize;
//    }
//    
//    return size;
//}

#pragma mark - 方法二
-(unsigned long long)fileSize {
    
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路径是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    // 判断文件夹还是文件
    if (isDirectory) { // 文件夹
        // 获得文件夹的大小 == 文件夹中所有文件的大小之和
        // Enumerator ： 遍历器/迭代器
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self]; // 目前只是获取文件夹中文件的大小，而不是文件本身的大小
        for (NSString *subpath in enumerator) {
            // 全路径 拼接
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 文件的属性（不是文件夹！）
            NSDictionary *attrs = [mgr attributesOfItemAtPath:fullSubpath error:nil];
            // 累加文件大小
            size += attrs.fileSize;
        }
    } else { // 文件
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

//// 获取缓存大小
//-(void)getCacheSize {
//    
//    // 总大小
//    NSUInteger size = 0;
//    
//    // 获得缓存文件夹路径
//    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
//    NSString *dirpath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
//    
//    // 文件管理者
//    NSFileManager *mgr = [NSFileManager defaultManager];
//    
//    // 获得文件夹的大小 == 文件夹中所有文件的大小之和
//    //    // Enumerator ： 遍历器/迭代器
//    //    NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:dirpath];
//    //    for (NSString *subpath in enumerator) {...}
//    NSArray *subpaths = [mgr subpathsAtPath:dirpath];
//    for (NSString *subpath in subpaths) {
//        // 全路径 拼接
//        NSString *fullSubpath = [dirpath stringByAppendingPathComponent:subpath];
//        // 文件的属性（不是文件夹！）
//        NSDictionary *attrs = [mgr attributesOfItemAtPath:fullSubpath error:nil];
//        // 累加文件大小
//        size += attrs.fileSize;
//        //        size += [attrs[NSFileSize] unsignedIntegerValue];
//    }
//    NSLog(@"%zd",size);
//}

@end
