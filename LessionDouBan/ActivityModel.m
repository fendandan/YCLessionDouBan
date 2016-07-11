//
//  ActivityModel.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super initWithDict:dict]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDic:(NSDictionary *)dic {
    [super modelWithDic:dic];
    return [[self alloc] initWithDict:dic];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", _title, _user.ID];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
    else if ([key isEqualToString:@"owner"]) {
        OwnerModel *model = [OwnerModel modelWithDic:value];
        _user = model;
    }
}

@end
