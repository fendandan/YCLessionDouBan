//
//  ActivityTableViewCell.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ActivityTableViewCell_Identifiter @"ActivityTableViewCell_Identifiter"

@interface ActivityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *interestingNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *joinNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;

@property (strong, nonatomic) ActivityModel *activityModel;

@end
