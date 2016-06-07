//
//  PleaseLoginController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/7.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "PleaseLoginController.h"
#import "MineLoginController.h"
@interface PleaseLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation PleaseLoginController
- (IBAction)login:(id)sender {
    
    NSString *username = @"admin";
    NSString *password = @"admin";
    
    if ([self.userName.text isEqualToString:username ] && [self.password.text  isEqual: password]) {
        [self.navigationController pushViewController:[MineLoginController new] animated:YES];
    }
    
}
- (IBAction)registerByPhone:(id)sender {
}
- (IBAction)findBackPassword:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.login.layer.cornerRadius = 5;
    
    self.login.layer.masksToBounds = YES;
    
    self.password.secureTextEntry = YES;
    
    self.title = @"牛13登录";

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
