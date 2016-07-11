//
//  DouBanTabBar.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DouBanTabBar;
@protocol DouBanTabBarDelegate <NSObject>

- (void)douBanTabBarItemDidClicked:(DouBanTabBar *)tabBar;
@end

@interface DouBanTabBar : UITabBar


// 当前选中的tabBar（标号）
@property (assign, nonatomic) int currentSelected;

// 当前选中的tabBarItem（实体）
@property (strong, nonatomic) UIButton *currebtSelectedItem;

// tabBar上所有的item
@property (strong, nonatomic) NSArray *allItems;

@property (weak, nonatomic) id<DouBanTabBarDelegate> dbTBdelegete;

// 初始化方法：根据items初始化tabBar
- (instancetype)initWithItems:(NSArray *)items frame:(CGRect)frame;


@end
