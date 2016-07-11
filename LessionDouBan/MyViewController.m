//
//  MyViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MyViewController.h"


@interface MyViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSArray *titles;

@end

@implementation MyViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.myTableView) {
        [self.myTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }
}
- (void)loadView {
    [super loadView];
    self.bbb = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self addRightNavigationItem];
    
    
    // 或者填写nibWithNibName为@"MyHeaderTableViewCell"等。。。
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyHeaderTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identifiter];
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MytableViewCell_Identifiter];
    
    self.titles = @[@"我的活动", @"我的电影", @"清除缓存"];
}

- (void)addRightNavigationItem {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateNormal];
    // TODO:
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(rightBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
- (void)rightBarButtonClicked:(UIBarButtonItem *)barButtonItem {
    YCLogFunc;
    // 跳转
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginViewController *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
    
}

#pragma mark --- 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // tableView.autoresizesSubviews = NO;
    MyHeaderTableViewCell *headerCell = [tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identifiter];
//    if (headerCell == nil) {
//        headerCell = [[MyHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyHeaderTableViewCell_Identifiter];
//    }
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MytableViewCell_Identifiter];
//    if (cell == nil) {
//        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MytableViewCell_Identifiter];
//    }
    if (indexPath.row == 0) {
        headerCell.selectionStyle = NO;
        if ([self.isLogin isEqualToString:@"1"]) {
            headerCell.username.text  = @"已登录";
            NSString *dataPath = [self.documentPath stringByAppendingPathComponent:@"avatar.jpg"];
            // 从文件获取图片
            headerCell.avatarImageView.image = [UIImage imageWithContentsOfFile:dataPath];
        }else {
            headerCell.selectionStyle = NO;
            headerCell.username.text  = @"未登录";
        }
        return headerCell;
    }else {
        cell.titleLabel.text = self.titles[indexPath.row - 1];
        if (indexPath.row == 3) {
            
            cell.overheadInformation.text = [NSString stringWithFormat:@"%0.1fM",self.cacheFileSize];
        } else {
            cell.overheadInformation.text = @"";
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 151;
    }
    return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3 && self.cacheFileSize) {
        [self removeCache];
        [tableView reloadData];
    }
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
