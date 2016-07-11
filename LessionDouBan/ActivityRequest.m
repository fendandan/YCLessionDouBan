//
//  ActivityRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest

- (void)activityRequestWithParameter:(NSDictionary *)parameterDic success:(SuccessResponse)success failure:(FailureResponse)failure {
    
    NetworkRequest *request = [[NetworkRequest alloc] init];
    [request requestWithUrl:ActivityRequest_URL parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}

@end
