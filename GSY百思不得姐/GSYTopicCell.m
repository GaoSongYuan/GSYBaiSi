//
//  GSYTopicCell.m
//  GSY百思不得姐
//
//  Created by Song on 2017/10/18.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTopicCell.h"
#import "XMGTopic.h"
#import <UIImageView+WebCache.h>

@interface GSYTopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView; // 头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel; // 昵称
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel; // 时间
@property (weak, nonatomic) IBOutlet UILabel *text_label; // 文字内容
@property (weak, nonatomic) IBOutlet UIButton *dingButton; // 顶！d=====(￣▽￣*)b
@property (weak, nonatomic) IBOutlet UIButton *caiButton; // 踩
@property (weak, nonatomic) IBOutlet UIButton *repostButton; // 分享
@property (weak, nonatomic) IBOutlet UIButton *commentButton; // 评论
/** 最热评论-整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView; // 最热评论View
@property (weak, nonatomic) IBOutlet UILabel *topCmtContentLabel; // 最热评论-内容

@end

@implementation GSYTopicCell



-(void)setTopic:(XMGTopic *)topic {
    
    _topic = topic;
    
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.nameLabel.text = topic.name; // 用户的名字
    self.createdAtLabel.text = topic.created_at; // 帖子审核通过的时间 字符串
    self.text_label.text = topic.text; // 帖子的文字内容
    
    // 手机当前时间
//    NSDate *nowDate = [NSDate date]; // 2017-12-27 12:00:11 +0000
    
    
    
//    NSCalendar *calendar = nil;
//    // 利用NSCalendar是否含有方法来控制NSCalendar的使用
//    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
//        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
//    } else {
//        calendar = [NSCalendar currentCalendar];
//    }
//    
//    // 利用iOS版本来控制NSCalendar的使用
//    if (iOS(8.0)) {
//        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
//    } else {
//        calendar = [NSCalendar currentCalendar];
//    }
   
    
    // 按钮数字的变化（繁琐）
//    if (topic.ding >= 10000) {
//        [self.dingButton setTitle:[NSString stringWithFormat:@"%.1f万",topic.ding/10000.0] forState:UIControlStateNormal];
//    } else if (topic.ding > 0) {
//        [self.dingButton setTitle:[NSString stringWithFormat:@"%zd",topic.ding] forState:UIControlStateNormal];
//    } else {
//        [self.dingButton setTitle:@"顶" forState:UIControlStateNormal];
//    }
    

    // 设置按钮的数字变化
    [self setupButton:self.dingButton number:topic.ding placeholder:@"顶"];
    [self setupButton:self.caiButton number:topic.cai placeholder:@"踩"];
    [self setupButton:self.repostButton number:topic.repost placeholder:@"分享"];
    [self setupButton:self.commentButton number:topic.comment placeholder:@"评论"];
    
//    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd",topic.ding] forState:UIControlStateNormal];
//    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd",topic.cai] forState:UIControlStateNormal];
//    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd",topic.repost] forState:UIControlStateNormal];
//    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd",topic.comment] forState:UIControlStateNormal];
    
}


/**
 设置按钮的数字变化

 @param button 按钮
 @param number 数字
 @param placeholder 占位文字
 */
-(void)setupButton:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder{
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    } else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    } else {
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

// 重写目的：拦截所有设置cell frame的操作
// 设置cell的frame
-(void)setFrame:(CGRect)frame {
//    frame.origin.x += GSYMargin; // 左边间距 10
//    frame.size.width -= 2 * GSYMargin; // 右边间距 10
    
    frame.size.height -= GSYMargin; // 高度减少10，分组
    frame.origin.y += GSYMargin; // 上边间距 10
    
    [super setFrame:frame];
    
}



// 点击更多按钮（三个点）
- (IBAction)more:(id)sender {
    // 屏幕中间的alert
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"othertitle", nil];
//    [alert show];
    
    // 屏幕下方出现alert 点击空白处alert会退出
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:nil cancelButtonTitle:@"cancel" destructiveButtonTitle:@"buttontitle" otherButtonTitles:@"otherbuttontitle", nil];
//    [sheet showInView:self];
    
    // alert 统一的使用：(利用modal，出现控制器)
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
    }]];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了收藏按钮");
    }]];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了举报按钮");
    }]];
    [self.window.rootViewController presentViewController:alertCon animated:YES completion:nil];
}



//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
