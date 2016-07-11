//
//  BaseModel.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDic:(NSDictionary *)dic;

@end
