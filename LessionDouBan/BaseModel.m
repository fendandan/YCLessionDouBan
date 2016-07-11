//
//  BaseModel.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDict:dic];
}

//- (NSString *)description
//{
//    return [NSString stringWithFormat:@"<#format string#>", <#arguments#>];
//}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//    
//}

@end
