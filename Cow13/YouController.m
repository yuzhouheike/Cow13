//
//  YouController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "YouController.h"
#import "SDCycleScrollView.h"
@interface YouController ()<SDCycleScrollViewDelegate>
// button 吃 玩 劳 用 帮
@property (nonatomic, strong) UIButton *button;

@end

@implementation YouController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    [self setupUI];
    
}

- (void) setupUI {
    
    
    NSArray *titleArray = @[@"吃", @"玩", @"劳", @"用", @"帮"];
    NSArray *backgroundImage = @[@"背景图片", @"背景图片", @"背景图片", @"背景图片",@"背景图片"];
    
    for (NSInteger index = 0 ; index < 5 ; index ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat height = (CGRectGetHeight(self.view.bounds) - 20 -64 ) / 5.0;
        
        button.frame = CGRectMake(0, index * height, CGRectGetWidth(self.view.bounds), height);
        button.tag = index + 100;
        
        button.titleLabel.font = [UIFont systemFontOfSize:50];
        
        [button setTitleColor:RandomColor forState:UIControlStateNormal];
        
        [button setTitle:titleArray[index] forState:UIControlStateNormal];
        
        NSString *imageName = backgroundImage[index];
        
        [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void) doAction:(UIButton *)button {
    
    
    NSLog(@"%@ title : %@", @(button.tag), button.titleLabel.text);
    
    
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
