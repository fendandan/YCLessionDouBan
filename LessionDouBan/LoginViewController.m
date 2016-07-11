//
//  LoginViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)login {
    // 验证保护
    if ([self.userNameTextField.text length] == 0) {
        YCLog(@"用户名不能为空！");
        [self alertViewShowWithTitle:@"用户名不能为空！"];
    }else if ([self.passwordTextField.text length] == 0) {
        YCLog(@"密码不能为空！");
        [self alertViewShowWithTitle:@"密码不能为空！"];
    }else {
        LoginRequest *request = [[LoginRequest alloc] init];
        [request loginRequestWithUserName:self.userNameTextField.text password:self.passwordTextField.text successResponse:^(NSDictionary *dic) {
            YCLog(@"%@",dic);
            
            long code = [[dic objectForKey:@"code"] longValue];
            NSString *codeString = [[dic objectForKey:@"code"] stringValue];
            if (code == 1103 || [codeString isEqualToString:@"1103"]) {
                
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                // 保存
                [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                // TODO:本地登录状态
                NSDictionary *dic = @{@"kLogin":@"1"};
                [self goToSaveK8VWithDicName:@"kLogin.plist" Dic:dic];
                
                // 返回
                [self dismissViewControllerAnimated:YES completion:^{}];
            }
            
        } failureResponse:^(NSError *error) {
            YCLog(@"%@",error);
        }];
    }
}

- (IBAction)loginButtonAction:(id)sender {
    // 登录
    [self login];
    
}
- (IBAction)gotoRegisterButtonAction:(id)sender {
    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RegisterViewController *rVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self presentViewController:rVC animated:YES completion:^{}];
}

- (void)alertViewShowWithTitle:(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.userNameTextField == textField ) {
        [self.passwordTextField becomeFirstResponder];
    }else {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:^ {    }];
}
- (void)loadView {
    [super loadView];
    self.bbb = YES;
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
