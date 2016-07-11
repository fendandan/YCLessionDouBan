//
//  TheaterTableViewCell.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "TheaterTableViewCell.h"

@implementation TheaterTableViewCell

- (void)setTheaterModel:(TheaterModel *)theaterModel {
    if (_theaterModel != theaterModel) {
        _theaterModel = nil;
        _theaterModel = theaterModel;
        
        self.cityNameLabel.text = theaterModel.cinemaName;
        if (![theaterModel.address isEqualToString:@""]) {
            self.telephoneLabel.text = theaterModel.telephone;
        }
        self.addressLabel.text = theaterModel.address;
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
