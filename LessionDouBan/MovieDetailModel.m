//
//  MovieDetailModel.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MovieDetailModel.h"

@implementation MovieDetailModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _ID];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

@end
