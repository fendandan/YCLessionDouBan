//
//  MovieViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *movies;
@property (weak, nonatomic) IBOutlet UITableView *movieTableView;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestMovieData];
    [self.movieTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MovieTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieTableViewCell_Identifiter];
    self.movieTableView.backgroundColor = [UIColor colorWithRed:206/255.0 green:224/255.0 blue:228/255.0 alpha:1.0];
    
    self.navigationItem.backBarButtonItem.title = @"电影";
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)requestMovieData
{
    __weak typeof(self) weakself = self;
    MovieRequest *request = [[MovieRequest alloc] init];
    [request movieRequestWithParameter:nil success:^(NSDictionary *dic) {
//        YCLog(@"%@",dic);
        self.navigationItem.title = dic[@"title"];
        weakself.movies = [NSMutableArray array];
        for (NSDictionary *mDic in dic[@"entries"]) {
            MovieModel *model = [MovieModel modelWithDic:mDic];
            [weakself.movies addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.movieTableView reloadData];
            [GiFHUD dismiss];
        });
        YCLog(@"%@",weakself.movies);
    } failure:^(NSError *error) {
        YCLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell_Identifiter forIndexPath:indexPath];
    
    MovieModel *mModel = (MovieModel *)self.movies[indexPath.row];
    cell.movieModel = mModel;
    cell.contentView.backgroundColor = self.movieTableView.backgroundColor;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 141;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieModel *aModel = (MovieModel *)self.movies[indexPath.row];
    [self performSegueWithIdentifier:@"movieDetail" sender:aModel];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"movieDetail"]) {
        MovieDetailViewController *mdVC = (MovieDetailViewController *)segue.destinationViewController;
        mdVC.mModel = (MovieModel *)sender;
        if ([[NSUserDefaults standardUserDefaults] objectForKey:mdVC.mModel.ID]) {
            mdVC.bool1 = YES;
            self.navigationItem.title = @"电影";
        }
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"正在上映的电影";
}


@end
