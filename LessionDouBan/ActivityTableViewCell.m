//
//  ActivityTableViewCell.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell


- (void)setActivityModel:(ActivityModel *)activityModel {
    if (_activityModel != activityModel) {
        _activityModel = nil;
        _activityModel = activityModel;
        
        self.titleLabel.text = activityModel.title;
        self.dateLabel.text = [NSString stringWithFormat:@"%@-%@",activityModel.begin_time,activityModel.end_time];
        self.addressLabel.text = activityModel.address;
        self.activityTypeLabel.text = activityModel.category;
        self.interestingNumberLabel.text = [NSString stringWithFormat:@"感兴趣：%@",activityModel.wisher_count];
        self.joinNumberLabel.text = [NSString stringWithFormat:@"参加：%@",activityModel.participant_count];
        [self.activityImageView setImageWithURL:[NSURL URLWithString: activityModel.image]];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
