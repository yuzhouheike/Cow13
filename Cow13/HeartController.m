//
//  HeartController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "HeartController.h"
#import "SDCycleScrollView.h"
@interface HeartController ()<SDCycleScrollViewDelegate>

// controllers的名字

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation HeartController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (NSMutableArray *)array {
    
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void) doAction:(UIButton *)button {
    
    
    
    NSArray *controllersArray = @[@"JiaoDian", @"LaiYue", @"PinDan"];
    
    [self.navigationController pushViewController:[NSClassFromString([NSString stringWithFormat:@"%@Controller", controllersArray[button.tag - 100]]) new] animated:YES];
    
}

#pragma 设置UI界面 吃 玩 劳 用 帮
- (void) setupUI {
    
    
    NSArray *titleArray = @[@"Jiao 点", @"来 Yue", @"Pin 单"];
    //    NSArray *backgroundImage = @[@"背景图片"];
    
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
