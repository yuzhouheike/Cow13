//
//  CarBuyController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/10.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "CarBuyController.h"

@interface CarBuyController ()

@end

@implementation CarBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"购物车";
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
//    self.tabBarController.tabBar.hidden = NO;
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
