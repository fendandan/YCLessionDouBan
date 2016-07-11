//
//  TheaterModel.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseModel.h"

@interface TheaterModel : BaseModel

// 影院ID
@property (copy, nonatomic) NSString *ID;

// 城市名称
@property (copy, nonatomic) NSString *cityName;

// 影院名称
@property (copy, nonatomic) NSString *cinemaName;

// 地址
@property (copy, nonatomic) NSString *address;

// 联系电话
@property (copy, nonatomic) NSString *telephone;

// 纬度
@property (copy, nonatomic) NSString *latitude;

// 经度
@property (copy, nonatomic) NSString *longitude;

// 交通路线
@property (copy, nonatomic) NSString *trafficRoutes;

@end
