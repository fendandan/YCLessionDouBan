//
//  ActivityModel.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseModel.h"
#import "OwnerModel.h"

@interface ActivityModel : BaseModel

// 活动的分类
@property (copy, nonatomic) NSString *subcategory_name;

// 显示的图片
@property (copy, nonatomic) NSString *image;

// 活动信息（网页版）
@property (copy, nonatomic) NSString *adapt_url;

// 活动所在地
@property (copy, nonatomic) NSString *loc_name;

// 活动发布者
@property (strong, nonatomic) OwnerModel *user;

// 购票网址
@property (copy, nonatomic) NSString *alt;

// 活动id
@property (copy, nonatomic) NSString *ID;

// 分类
@property (copy, nonatomic) NSString *category;

// 分类名
@property (copy, nonatomic) NSString *category_name;

// 内容
@property (copy, nonatomic) NSString *content;

// 结束时间
@property (copy, nonatomic) NSString *end_time;

// 地理编码
@property (copy, nonatomic) NSString *geo;

// 地址
@property (copy, nonatomic) NSString *address;

// 专辑
@property (copy, nonatomic) NSString *album;

// 开始时间
@property (copy, nonatomic) NSString *begin_time;

// 有无票
@property (assign, nonatomic) BOOL has_ticket;

// 标题
@property (copy, nonatomic) NSString *title;

// 祝福者数量
@property (copy, nonatomic) NSString *wisher_count;

@property (copy, nonatomic) NSString *tags;

// 价格区间
@property (copy, nonatomic) NSString *price_range;

// photos
@property (strong, nonatomic) NSArray *photos;

@property (copy, nonatomic) NSString *participant_count;

@property (copy, nonatomic) NSString *loc_id;

@property (copy, nonatomic) NSString *image_hlarge;
@property (copy, nonatomic) NSString *image_lmobile;

@property (copy, nonatomic) NSString *can_invite;

@end
