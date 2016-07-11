//
//  LoginRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest

- (void)loginRequestWithUserName:(NSString *)userName password:(NSString *)password successResponse:(SuccessResponse)success failureResponse:(FailureResponse)failure {
    NetworkRequest *request = [[NetworkRequest alloc] init];
    [request sendDataWithUrl:LoginRequest_URL parameters:@{@"userName":userName,@"password":password} successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
