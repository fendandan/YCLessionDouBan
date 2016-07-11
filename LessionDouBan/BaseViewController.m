//
//  BaseViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (!_bbb) {
        [GiFHUD showWithOverlay]; // 大蒙版
        [GiFHUD setGifWithImageName:@"pika.gif"];
    }
}
// 获取文件夹
- (NSString *)documentPath {
    if (!_documentPath) {
        _documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    }
    return _documentPath;
}

#pragma mark --- 获取缓存大小（getter方法）
- (float)cacheFileSize {
    if (!_cacheFileSize) {
        //文件管理
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //缓存路径
        NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *cacheDir = [cachePaths objectAtIndex:0];
        YCLog(@"%@",cacheDir);
        NSArray *cacheFileList;
        NSEnumerator *cacheEnumerator;
        NSString *cacheFilePath;
        unsigned long long cacheFolderSize = 0;
        cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
        cacheEnumerator = [cacheFileList objectEnumerator];
        while (cacheFilePath = [cacheEnumerator nextObject])
        {
            NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
            cacheFolderSize += [cacheFileAttributes fileSize];
        }
        //单位MB
        return cacheFolderSize/1024/1024;
    }
    return _cacheFileSize;
}

#pragma mark --- 清除缓存方法
- (void)removeCache
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    for (NSString *string in cachePaths)
    {
        if ([fileManager fileExistsAtPath:string])
        {
            NSError *error = nil;
            if([fileManager removeItemAtPath:string error:&error])
            {
                YCLog(@"文件移除成功");
            } else
            {
                YCLog(@"error=%@", error);
            }
        }
    }
}
#pragma mark --- 数组转换为字符串
- (NSString *)getStringWithArray:(NSArray *)array {
    
    NSMutableString *str = [NSMutableString string];
    for (NSString * obj in array) {
        [str appendFormat:@"%@ ",obj];
    }
    return str;
    
}
- (void)addRightNavigationItemBarButton {
    UIButton *shareB = [UIButton buttonWithType:UIButtonTypeCustom];
    shareB.frame = CGRectMake(0, 0, 20, 10);
    shareB.titleLabel.font = [UIFont systemFontOfSize:10];
    [shareB setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [shareB setTitle:@"分享" forState:UIControlStateNormal];
    [shareB addTarget:self action:@selector(shareBAction:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *markB = [UIButton buttonWithType:UIButtonTypeCustom];
    if (self.bool1) {
        [markB setTitle:@"OK" forState:UIControlStateNormal];
    }else {
        [markB setTitle:@"收藏" forState:UIControlStateNormal];
    }
    markB.frame = CGRectMake(0, 0, 20, 10);
    markB.titleLabel.font = [UIFont systemFontOfSize:10];
    [markB setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [markB addTarget:self action:@selector(markBAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *sBBI = [[UIBarButtonItem alloc] initWithCustomView:shareB];
    UIBarButtonItem *mBBI = [[UIBarButtonItem alloc] initWithCustomView:markB];
    self.navigationItem.rightBarButtonItems = @[sBBI, mBBI];
}
// 写入字典plist
- (void)goToSaveK8VWithDicName:(NSString *)dicName Dic:(NSDictionary *)dic {
    
    NSString *dicPath = [self.documentPath stringByAppendingPathComponent:dicName];
    [dic writeToFile:dicPath atomically:YES];
}
// 读取字典的key对应的value
- (NSString *)getMarkWithKey:(NSString *)key marcoPath:(NSString *)marcoPath {
    NSString *dicPath = [self.documentPath stringByAppendingPathComponent:marcoPath];
    NSDictionary *resultDic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    return resultDic[key];
}
- (NSString *)isLogin {
    NSString *dicPath = [self.documentPath stringByAppendingPathComponent:@"kLogin.plist"];
    NSDictionary *resultDict = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    YCLog(@"%@",resultDict);
    return resultDict[@"kLogin"];
}
//
- (void)aalertViewShowWithTitle:(NSString *)title otherTitle:(NSString *)otherTitle {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:otherTitle, nil];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        RegisterViewController *rVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
        [self presentViewController:rVC animated:YES completion:^{}];
    }else {
        YCLogFunc;
    }
}
// 未实现的方法
- (void)alertControllerShowWith:(NSString *)title {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    UIAlertAction *aA = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:aA];
    [self presentViewController:alertC animated:YES completion:^{
        
    }];
}
//- (NSString *)isLogin {
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
