//
//  MyHeaderTableViewCell.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MyHeaderTableViewCell_Identifiter @"MyHeaderTableViewCell_Identifier"

@interface MyHeaderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *username;

@end
