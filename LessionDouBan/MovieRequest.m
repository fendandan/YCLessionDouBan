//
//  MovieRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MovieRequest.h"

@implementation MovieRequest

- (void)movieRequestWithParameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetworkRequest *request = [[NetworkRequest alloc] init];
    [request requestWithUrl:MovieRequest_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
