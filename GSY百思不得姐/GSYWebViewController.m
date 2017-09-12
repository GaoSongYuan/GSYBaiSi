//
//  GSYWebViewController.m
//  GSY百思不得姐
//
//  Created by Song on 2017/9/11.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYWebViewController.h"

@interface GSYWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

@end

@implementation GSYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (IBAction)reload {
    [self.webView reload];
}
- (IBAction)back:(id)sender {
    [self.webView goBack];
}
- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

#pragma mark - <UIWebViewDelegate>
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    self.back.enabled = webView.canGoBack;
    self.forward.enabled = webView.canGoForward;
}

@end
