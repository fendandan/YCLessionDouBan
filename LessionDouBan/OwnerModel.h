//
//  OwnerModel.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel

// 名字
@property (copy, nonatomic) NSString *name;

// 购票网址
@property (copy, nonatomic) NSString *alt;

// 影片名称
@property (copy, nonatomic) NSString *avatar;

// 影片ID
@property (copy, nonatomic) NSString *ID;

// 影片配图
@property (copy, nonatomic) NSString *large_avatar;

// 类型
@property (copy, nonatomic) NSString *type;

// 豆瓣uid
@property (copy, nonatomic) NSString *uid;

@end
