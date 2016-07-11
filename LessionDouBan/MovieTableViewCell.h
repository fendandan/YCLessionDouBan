//
//  MovieTableViewCell.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MovieTableViewCell_Identifiter @"MovieTableViewCell_Identifiter"

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubdateLabel;

@property (strong, nonatomic) MovieModel *movieModel;

@end
