//
//  PublichController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/8.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "PublichController.h"

@interface PublichController ()

@end

@implementation PublichController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"发布";
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"succeed");
    }];
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
