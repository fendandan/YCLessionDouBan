//
//  LoginRequest.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject

- (void)loginRequestWithUserName:(NSString *)userName password:(NSString *)password successResponse:(SuccessResponse)success failureResponse:(FailureResponse)failure;

@end
