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
    
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd",topic.ding] forState:UIControlStateNormal];
    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd",topic.cai] forState:UIControlStateNormal];
    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd",topic.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd",topic.comment] forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}




@end
