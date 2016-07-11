//
//  MovieModel.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseModel.h"

@interface MovieModel : BaseModel

// 收藏数
@property (copy, nonatomic) NSString *collection;

// 影片ID
@property (copy, nonatomic) NSString *ID;

// 影片配图
@property (strong, nonatomic) NSDictionary *images;

// 原标题
@property (copy, nonatomic) NSString *original_title;

// 上映时间
@property (copy, nonatomic) NSString *pubdate;

// 评分
@property (copy, nonatomic) NSString *rating;

// 演员人数
@property (copy, nonatomic) NSString *stars;

// 标题
@property (copy, nonatomic) NSString *title;

// 想看人数
@property (copy, nonatomic) NSString *wish;


@end
