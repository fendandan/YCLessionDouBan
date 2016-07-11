//
//  MovieDetailRequest.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailRequest : NSObject

- (void)movieWithParameter:(NSDictionary *)parameter
                   success:(SuccessResponse)success
                   failure:(FailureResponse)failure;

@end
