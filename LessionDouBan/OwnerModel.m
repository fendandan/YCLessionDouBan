//
//  OwnerModel.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel

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

#warning do not to write this description if you did writed ActivityModel'descripation
//- (NSString *)description
//{
//    return [NSString stringWithFormat:@"%@", _ID];
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

@end
