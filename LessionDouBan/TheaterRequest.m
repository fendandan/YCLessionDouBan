//
//  TheaterRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "TheaterRequest.h"

@implementation TheaterRequest

- (void)theaterRequestWithParameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetworkRequest *request = [[NetworkRequest alloc] init];
    [request requestWithUrl:TheaterRequest_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        
        success(dic);
        
    } failureResponse:^(NSError *error) {
        
        failure(error);
        
    }];
}

@end
