//
//  RootViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<DouBanTabBarDelegate>

@property (strong, nonatomic) DouBanTabBar *dbTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 隐藏系统的tabBar
    self.tabBar.hidden = YES;
    NSArray *buttonArr = @[[self buttonWithImageName:@"paper" title:@"活动"],[self buttonWithImageName:@"video" title:@"电影"],[self buttonWithImageName:@"2image" title:@"影院"], [self buttonWithImageName:@"person" title:@"我的"]];
    self.dbTabBar = [[DouBanTabBar alloc] initWithItems:buttonArr frame:CGRectMake(0, self.view.bounds.size.height - 49, self.view.bounds.size.width, 49)];
    
    UIButton *btn = buttonArr[0];
    btn.selected = YES;
//    self.selectedIndex = 1;
    [self.view addSubview:self.dbTabBar];
//    if (self.childViewControllers.count == 1) {
//        [self.view addSubview:self.dbTabBar];
//    }else {
//    }
    
    
    self.dbTabBar.dbTBdelegete = self;
    
}

- (UIButton *)buttonWithImageName:(NSString *)imageName title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@H",imageName]] forState:UIControlStateSelected];
//    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    button.titleEdgeInsets = UIEdgeInsetsMake(44, 0, 0, 0);
    
    return button;
}
//- (void)buttonClicked:(UIButton *)button {
//    if (self.dbTabBar.dbTBdelegete == nil) {
//        self.dbTabBar.dbTBdelegete = self;
//    }
//}
#pragma mark --- DouBanTabBarDelegate ---
- (void)douBanTabBarItemDidClicked:(DouBanTabBar *)tabBar {
    // 切换选中控制器
    self.selectedIndex = tabBar.currentSelected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
