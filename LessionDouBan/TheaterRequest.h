//
//  TheaterRequest.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterRequest : NSObject

- (void)theaterRequestWithParameter:(NSDictionary *)parameterDic
                      success:(SuccessResponse)success
                      failure:(FailureResponse)failure;

@end
