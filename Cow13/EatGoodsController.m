//
//  EatGoodsController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/10.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "EatGoodsController.h"
#import "CarBuyController.h"
#import "BuyNowController.h"
@interface EatGoodsController ()

@end

@implementation EatGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)joinBuyCar:(id)sender {
    
    
    [self.navigationController pushViewController:[CarBuyController new] animated:YES];
}
- (IBAction)buyNow:(id)sender {
 
    
    [self.navigationController pushViewController:[BuyNowController new] animated:YES];
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
