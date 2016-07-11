//
//  ActivityViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *activities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

static NSString * const cell_ID = @"cell";

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor colorWithRed:206/255.0 green:224/255.0 blue:228/255.0 alpha:1.0];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ActivityTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cell_ID];
    
    
    [self requestActivityData];
    
}

- (void)requestActivityData
{
    
    __weak typeof(self) weakself = self;
    ActivityRequest *activity = [[ActivityRequest alloc] init];
    [activity activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        
        weakself.activities = [NSMutableArray array];
        for (NSDictionary *mDic in dic[@"events"]) {
            ActivityModel *aModel = [ActivityModel modelWithDic:mDic];
            [weakself.activities addObject:aModel];
            
        }
        YCLog(@"activities = %@",weakself.activities);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.tableView reloadData];
            [GiFHUD dismiss];
        });
    } failure:^(NSError *error) {
        
        YCLog(@"failure = %@",error);
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID forIndexPath:indexPath];
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID];
    ActivityModel *aModel = (ActivityModel *)self.activities[indexPath.row];
    
    cell.activityModel = aModel;
    cell.contentView.backgroundColor = self.tableView.backgroundColor;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 166;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActivityModel *aModel = (ActivityModel *)self.activities[indexPath.row];
    [self performSegueWithIdentifier:@"activityDetail" sender:aModel];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        ActivityDetailViewController *adVC = (ActivityDetailViewController *)[segue destinationViewController];
        adVC.activityModel = (ActivityModel *)sender;
//        [[NSUserDefaults standardUserDefaults] objectForKey:adVC.activityModel.ID]
        if ([self getMarkWithKey:adVC.activityModel.ID marcoPath:kActivity]) {
            adVC.bool1 = YES;
        }
        
        
    }
    
}



@end
