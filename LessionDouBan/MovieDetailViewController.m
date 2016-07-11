//
//  MovieDetailViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "RootViewController.h"

#import "UMSocialSnsService.h"
#import "UMSocialSnsPlatformManager.h"

@interface MovieDetailViewController ()<UMSocialUIDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *wishLabel;
@property (weak, nonatomic) IBOutlet UITextView *informationLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@end

@implementation MovieDetailViewController
- (void)loadView {
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem.title = @"电影";
    
    [self addRightNavigationItemBarButton];
    [self movieData];
    [self.movieImage setImageWithURL:[NSURL URLWithString:self.mModel.images[@"medium"]]];
    self.informationLabel.alpha = 0.5;
    
}
- (void)movieData {
    MovieDetailRequest *request = [[MovieDetailRequest alloc] init];
    NSDictionary *parameter = @{@"id":self.mModel.ID};
    __weak typeof(self) weakself = self;
    [request movieWithParameter:parameter success:^(NSDictionary *dic) {
        YCLog(@"%@",dic);
        MovieDetailModel *mdModel = [MovieDetailModel modelWithDic:dic];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakself updateView:mdModel];
        });
    } failure:^(NSError *error) {
        YCLog(@"%@",error);
    }];
}
- (void)updateView:(MovieDetailModel *)model {
    
    self.informationLabel.text = model.summary;
    [self.movieImage setImageWithURL:[NSURL URLWithString:model.images[@"large"]]];
    self.ratingLabel.text = [NSString stringWithFormat:@"评分：%@  (%@评论)",model.rating[@"average"],model.comments_count];
//    self.dateLabel.text = model.pubdate;
    self.wishLabel.text = [self getStringWithArray:model.durations];
    self.typeLabel.text = [self getStringWithArray:model.genres];
    self.countryLabel.text = [self getStringWithArray:model.countries];
    self.navigationItem.title = model.title;
    [GiFHUD dismiss];
    
}

- (void)shareBAction:(UIButton *)shareB {
    [self umToShre];
}
- (void)markBAction:(UIButton *)markB {
    NSString *string = self.isLogin;
    if ([string isEqualToString:@"1"]) {
        if (!self.bool1) {
            
            self.bool1 = YES;
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:self.mModel.ID];
            self.navigationItem.rightBarButtonItems = nil;
            [self addRightNavigationItemBarButton];
            
        }else {
            self.bool1 = NO;
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.mModel.ID];
            self.navigationItem.rightBarButtonItems = nil;
            [self addRightNavigationItemBarButton];
        }
    }else {
        [self aalertViewShowWithTitle:@"未登录无法收藏" otherTitle:@"去注册"];
    }
        YCLogFunc;
}
- (void)umToShre {
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5773c9d567e58ed1ef000b39"
                                      shareText:@"分享" shareImage:[UIImage imageNamed:@"Share_20.16690647482px_1183447_easyicon.net"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina, UMShareToTencent,UMShareToRenren, UMShareToDouban, UMShareToQzone , UMShareToEmail, nil]
                                       delegate:self];
    YCLogFunc;
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        YCLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        
        YCLog( @"分享成功");
        
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
