//
//  GSYLoginRegisterViewController.m
//  GSY百思不得姐
//
//  Created by Song on 17/8/10.
//  Copyright © 2017年 Song. All rights reserved.
//





/* 
      在设置xib约束的时候，在设置登录界面整体的约束的时候，
      不要设置成： “登录界面trailing = view的trailing”
      要设置成：“登录界面与view等宽”，即：“ 登录界面.width = width ”
 */


#import "GSYLoginRegisterViewController.h"

@interface GSYLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;

@end

@implementation GSYLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.login.layer.cornerRadius = 5;
    self.login.layer.masksToBounds = YES;
}

// 状态栏白色
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 退出键盘
    [self.view endEditing:YES];
}

// 退出按钮
- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 登录注册切换
- (IBAction)loginOrRegister:(UIButton *)button {
    // 退出键盘
    [self.view endEditing:YES];
    
    if (self.leftMargin.constant) { // 非0，显示的是注册界面
        self.leftMargin.constant = 0;
        [button setTitle:@"注册帐号" forState:UIControlStateNormal];
    } else {
        self.leftMargin.constant = -self.view.gsy_width;
        [button setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    
    
    /*
        顶部按钮中，“注册帐号”按钮，需要设置为 system ，在切换按钮文字的时候才可以出现动画
     */
    
    // 切换动画，在键盘出现的时候切换界面，也会有动画
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
//    // 碰撞动画，但是在键盘出现的时候切换界面，则不显示动画，会卡
//    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut  animations:^{
//
//        [self.view layoutIfNeeded];
//    } completion:nil];
}

@end
