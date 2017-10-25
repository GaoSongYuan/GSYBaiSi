//
//  GSYTopicCell.h
//  GSY百思不得姐
//
//  Created by Song on 2017/10/18.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMGTopic;

@interface GSYTopicCell : UITableViewCell

/** 帖子模型数据 **/
@property(nonatomic,strong) XMGTopic *topic;

@end
