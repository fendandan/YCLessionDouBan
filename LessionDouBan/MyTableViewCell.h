//
//  MyTableViewCell.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MytableViewCell_Identifiter @"MytableViewCell_Identifiter"

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *overheadInformation;

@end
