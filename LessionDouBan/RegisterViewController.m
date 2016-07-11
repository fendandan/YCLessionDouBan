//
//  RegisterViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "RegisterViewController.h"

//typedef NS_ENUM(NSInteger, OK) {
//    defalt,
//    not
//};

@interface RegisterViewController ()<UIAlertViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userImage setImageWithURL:[NSURL URLWithString:@"http://162.211.125.85/douban/uploads/d9674cc4bbba459f195028c3aee59d79"]];
    
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"设置头像" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(290, 630, 120, 30)];
    [button addTarget:self action:@selector(gotoPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (IBAction)RegisterAction:(id)sender {
    [self regist];
    YCLogFunc;
}
- (void)regist {
    // 验证保护
    if ([self.userNameTextField.text length] == 0) {
        YCLog(@"用户名不能为空！");
        [self alertViewShowWithTitle:@"用户名不能为空！" otherTitle:@"离开"];
        
    }else if ([self.passwordTextField.text length] == 0) {
        YCLog(@"密码不能为空！");
        [self alertViewShowWithTitle:@"密码不能为空！" otherTitle:@"不注册"];
    }else {
        RegisterRequest *request = [[RegisterRequest alloc] init];
        [request registerRequestWithUserName:self.userNameTextField.text password:self.passwordTextField.text avator:self.userImage.image successResponse:^(NSDictionary *dic) {
            YCLog(@"%@",dic);
            
//            long code = [[dic objectForKey:@"code"] longValue];
//            NSString *codeString = [[dic objectForKey:@"code"] stringValue];
//            if (code == 1105 || [codeString isEqualToString:@"1105"])
            NSString *code = [[dic objectForKey:@"code"] stringValue];
            if ([code isEqualToString:@"1005"]) {
                
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                // 保存
                [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                // TODO: 注册成功保存用户图片
                if (self.userImage.image) {
                    NSData *data = UIImageJPEGRepresentation(self.userImage.image, 1); // 转换函数
                    NSString *dataPath = [self.documentPath stringByAppendingPathComponent:@"avatar.jpg"];
                    [data writeToFile:dataPath atomically:YES];
                }
                
                // 返回
                [self dismissViewControllerAnimated:YES completion:^{}];
                
                
            }
        } faliureResponse:^(NSError *error) {
            YCLog(@"%@",error);
        }];
    }
    YCLogFunc;
}

- (void)saveUserImage {
    
}

- (void)gotoPhoto:(UIButton *)button {
    YCLogFunc;
    if (self.userImage.image == nil) {
        //调用系统相册
        self.imagePickerController = [UIImagePickerController new];
        //设置代理
        self.imagePickerController.delegate = self;
        //允许图片编辑
        self.imagePickerController.allowsEditing = YES;
        //设置相册选完照片后，是否调到编辑模式，进行图片编辑
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
}


//三个代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = nil;
    //判断一下我们从哪里获取图片
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        //修改前的image
        image =[info objectForKey:UIImagePickerControllerOriginalImage];
    }else{
        //可编辑UIImagePickerControllerEditedImage（获取编辑后的图片）
        image = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    //设置图片
    self.userImage.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)alertViewShowWithTitle:(NSString *)title otherTitle:(NSString *)otherTitle {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:otherTitle, nil];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }else {
        YCLogFunc;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.userNameTextField == textField ) {
        [self.passwordTextField becomeFirstResponder];
    }else {
        [textField resignFirstResponder];
    }
    return YES;
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
