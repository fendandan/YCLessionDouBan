//
//  TheaterTableViewCell.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TheaterTableViewCell_Identifiter @"TheaterTableViewCell_Identifiter"

@interface TheaterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *telephoneLabel;

@property (strong, nonatomic) TheaterModel *theaterModel;

@end
