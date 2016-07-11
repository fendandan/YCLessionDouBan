//
//  ActivityDetailViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "ActivityDetailViewController.h"

#import "UMSocialSnsService.h"
#import "UMSocialSnsPlatformManager.h"

@interface ActivityDetailViewController ()<UMSocialUIDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goToNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *activityImageView;
@property (weak, nonatomic) IBOutlet UITextView *activityInformationLabel;


@end

@implementation ActivityDetailViewController
- (void)loadView {
    [super loadView];
    self.bbb = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    self.title = self.activityModel.title;
    [self addRightNavigationItemBarButton];
    [self updateView];
    self.activityInformationLabel.editable = NO;
    self.activityInformationLabel.alpha = 0.5;
}
- (void)updateView {
    self.titleLabel.text = self.activityModel.title;
    self.dateLabel.text = [NSString stringWithFormat:@"%@ - %@",self.activityModel.begin_time, self.activityModel.end_time];
    self.addressLabel.text = self.activityModel.address;
    self.activityTypeLabel.text = self.activityModel.category;
    //    self.goToNumberLabel.text = self.activityModel
    [self.activityImageView setImageWithURL:[NSURL URLWithString: self.activityModel.image]];
    self.activityInformationLabel.text = self.activityModel.content;
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
- (void)shareBAction:(UIButton *)shareB {
    [self umToShre];
}
- (void)markBAction:(UIButton *)markB {
    NSString *string = self.isLogin;
    YCLog(@"%@",self.isLogin);
    if ([string isEqualToString:@"1"]) {
        if (!self.bool1) {
            
            self.bool1 = YES;
            NSDictionary *dic = @{self.activityModel.ID:@"1"};
//            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:self.activityModel.ID];
            [self goToSaveK8VWithDicName:kActivity Dic:dic];
            self.navigationItem.rightBarButtonItems = nil;
            [self addRightNavigationItemBarButton];
            
        }else {
            self.bool1 = NO;
            
            NSString *dicPath = [self.documentPath stringByAppendingPathComponent:kActivity];
            NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithContentsOfFile:dicPath];
            [resultDict removeObjectForKey:self.activityModel.ID];
            [self goToSaveK8VWithDicName:kActivity Dic:resultDict];
            
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.activityModel.ID];
            self.navigationItem.rightBarButtonItems = nil;
            [self addRightNavigationItemBarButton];
        }
    }else {
        [self aalertViewShowWithTitle:@"未登录无法收藏" otherTitle:@"去注册"];
    }
    
    YCLogFunc;
    YCLog(@"%d",self.bool1);
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
