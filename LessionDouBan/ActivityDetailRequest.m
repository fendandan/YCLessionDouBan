//
//  ActivityDetailRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest


- (void)activityDetailRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetworkRequest *request = [[NetworkRequest alloc] init];
    NSString *ID = [parameter valueForKey:@"id"];
    [request requestWithUrl:ActivityDetailRequest_URL(ID) parameters:parameter successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
