//
//  ViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
//    [self requestActivityDetailDataWith:@"26865955"];
    [self requestMovieDetailDataWith:@"25777636"];
    
}

- (void)requestActivityDetailDataWith:(NSString *)ID {
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc] init];
    [request activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        YCLog(@"%@",dic);
    } failure:^(NSError *error) {
        YCLog(@"%@",error);
    }];
}

- (void)requestMovieDetailDataWith:(NSString *)ID {
    MovieDetailRequest *request = [[MovieDetailRequest alloc] init];
    [request movieWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        YCLog(@"%@",dic);
    } failure:^(NSError *error) {
        YCLog(@"%@",error);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    ActivityViewController *avc = [[ActivityViewController alloc] init];
    TheaterViewController
    *tVC = [[TheaterViewController alloc] init];
    MovieViewController *mVC = [[MovieViewController alloc] init];
    [self presentViewController:mVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
