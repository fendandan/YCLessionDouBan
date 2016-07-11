//
//  DouBanTabBar.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "DouBanTabBar.h"

@implementation DouBanTabBar

- (instancetype)initWithItems:(NSArray *)items frame:(CGRect)frame
{
    if (self = [super init])
    {
        self.frame = frame;
//        self.backgroundImage = [UIImage imageNamed:@"bg_nav"];
        self.backgroundColor = [UIColor lightGrayColor];
        
        for (int i = 0; i < items.count; i ++) {
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / items.count;
//            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i * width + 30, 0, 40, 40);
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
        self.currentSelected = 0;
        self.currebtSelectedItem = items[0];
        self.allItems = items;
        
    }
    return self;
}
  
- (void)layoutSubviews {
    
}

- (void)btnClicked:(UIButton *)btn {
    
    self.currebtSelectedItem = btn;
    for (int i = 0; i < self.allItems.count; i ++) {
        UIButton *tempButton = (UIButton *)self.allItems[i];
        if (btn == tempButton) {
            self.currentSelected = i;
            tempButton.selected = YES;
//            return;
        }else {
            tempButton.selected = NO;
        }
    }
    
    // 代理设计模式
    if (_dbTBdelegete && [_dbTBdelegete respondsToSelector:@selector(douBanTabBarItemDidClicked:)]) {
        
        [_dbTBdelegete douBanTabBarItemDidClicked:self];
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
