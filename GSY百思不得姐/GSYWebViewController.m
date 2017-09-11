//
//  GSYWebViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/11.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYWebViewController.h"

@interface GSYWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GSYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

@end
