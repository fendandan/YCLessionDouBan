//
//  TheaterViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "TheaterViewController.h"

@interface TheaterViewController ()

@property (strong, nonatomic) NSMutableArray *theaterArray;
@property (weak, nonatomic) IBOutlet UITableView *theaterTableView;

@end

@implementation TheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestTheaterData];
    [self.theaterTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TheaterTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheaterTableViewCell_Identifiter];
    self.theaterTableView.backgroundColor = [UIColor colorWithRed:206/255.0 green:224/255.0 blue:228/255.0 alpha:1.0];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)requestTheaterData {
    
    TheaterRequest *request = [[TheaterRequest alloc] init];
    __weak typeof(self) weakself = self;
    [request theaterRequestWithParameter:nil success:^(NSDictionary *dic) {
        YCLog(@"%@",dic);
        self.theaterArray = [NSMutableArray array];
        for (NSDictionary *tDic in dic[@"result"][@"data"]) {
            TheaterModel *tModel = [TheaterModel modelWithDic:tDic];
            [weakself.theaterArray addObject:tModel];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.theaterTableView reloadData];
            [GiFHUD dismiss];
        });
    } failure:^(NSError *error) {
        
        YCLog(@"%@",error.description);
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.theaterArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TheaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TheaterTableViewCell_Identifiter forIndexPath:indexPath];
    TheaterModel *theaterModel = (TheaterModel *)self.theaterArray[indexPath.row];
    cell.theaterModel = theaterModel;
    cell.contentView.backgroundColor = self.theaterTableView.backgroundColor;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 107;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    TheaterModel *aModel = (TheaterModel *)self.theaterArray[indexPath.row];
//    [self performSegueWithIdentifier:@"theaterDetail" sender:aModel];
    TheaterDetailViewController *tdVC = [[TheaterDetailViewController alloc] init];
    [self.navigationController pushViewController:tdVC animated:YES];
    
}

//- tableView

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"theaterDetail"]) {
        TheaterDetailViewController *tdVC = segue.destinationViewController;
        
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
