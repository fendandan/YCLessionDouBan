//
//  RegisterRequest.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest

- (void)registerRequestWithUserName:(NSString *)userName password:(NSString *)password avator:(UIImage *)image successResponse:(SuccessResponse)success faliureResponse:(FailureResponse)failure
{
    NetworkRequest *request = [[NetworkRequest alloc] init];
    
    [request sendDataWithUrl:RegistRequest_URL parameters:@{@"userName":userName, @"password":password} image:image successResponse:^(NSDictionary *dic)
    {
        success(dic);
        
    } failureResponse:^(NSError *error)
    {
        failure(error);
    }];
}

@end
