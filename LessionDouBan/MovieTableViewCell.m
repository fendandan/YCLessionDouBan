//
//  MovieTableViewCell.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)setMovieModel:(MovieModel *)movieModel {
    if (_movieModel != movieModel) {
        _movieModel = nil;
        _movieModel = movieModel;
        
        self.movieName.text = movieModel.title;
        if (![movieModel.rating isEqualToString:@""]) {
            self.ratingLabel.text = [NSString stringWithFormat:@"星级：%@",movieModel.rating];
        }
        self.pubdateLabel.text = movieModel.pubdate;
        [self.movieImageView setImageWithURL:[NSURL URLWithString:movieModel.images[@"large"]]];
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
