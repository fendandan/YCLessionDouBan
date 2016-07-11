//
//  BaseViewController.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/// 是否刷新？
@property BOOL bbb;
/// 收藏与否
@property BOOL bool1;
/// 登录状态（getter判断）
@property (strong, nonatomic) NSString *isLogin;

@property (strong, nonatomic) NSString *documentPath;
@property (assign, nonatomic) float cacheFileSize;

- (void)removeCache;
- (NSString *)getStringWithArray:(NSArray *)array;
- (void)addRightNavigationItemBarButton;
- (void)goToSaveK8VWithDicName:(NSString *)dicName Dic:(NSDictionary *)dic;
- (NSString *)getMarkWithKey:(NSString *)key marcoPath:(NSString *)marcoPath;
- (void)aalertViewShowWithTitle:(NSString *)title otherTitle:(NSString *)otherTitle;
@end
