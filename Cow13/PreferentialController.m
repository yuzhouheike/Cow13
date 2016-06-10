//
//  PreferentialController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "PreferentialController.h"

@interface PreferentialController ()

@end

@implementation PreferentialController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"福利";
    [self setupUI];
    
}


- (void) doAction:(UIButton *)button {
    
    
    
    NSArray *controllersArray = @[@"RobVolume",  @"SecondsKill" , @"LuckyDraw" ];
    
    [self.navigationController pushViewController:[NSClassFromString([NSString stringWithFormat:@"%@Controller", controllersArray[button.tag - 100]]) new] animated:YES];
    
}

#pragma 设置UI界面 吃 玩 劳 用 帮
- (void) setupUI {
    
    
    NSArray *titleArray = @[@"抢劵", @"秒杀", @"抽奖"];
    
    for (NSInteger index = 0 ; index < 3 ; index ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat height = (CGRectGetHeight(self.view.bounds) - 20 -64 ) / 5.0;
        
        button.frame = CGRectMake(0, index * height, CGRectGetWidth(self.view.bounds), height - 10);
        button.tag = index + 100;
        
        button.titleLabel.font = [UIFont systemFontOfSize:50];
        
        button.backgroundColor = [UIColor grayColor];
        
        [button setTitle:titleArray[index] forState:UIControlStateNormal];
        
        //        NSString *imageName = backgroundImage[index];
        
        //        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}
@end
