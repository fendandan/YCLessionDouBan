//
//  RegisterRequest.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject

- (void)registerRequestWithUserName:(NSString *)userName
                           password:(NSString *)password
                             avator:(UIImage *)image
                    successResponse:(SuccessResponse)success
                    faliureResponse:(FailureResponse)failure;

@end
