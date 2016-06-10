//
//  YouController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "YouController.h"
#import "SDCycleScrollView.h"
#import "EatController.h"
#import "UIImageView+WebCache.h"
@interface YouController ()<SDCycleScrollViewDelegate>
// button 吃 玩 劳 用 帮
@property (nonatomic, strong) UIButton *button;
// controllers的名字
@property (nonatomic, strong) NSArray *controllersArray;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation YouController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
}

- (NSMutableArray *)array {
    
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (NSArray *)controllersArray {
    
    if (!_controllersArray) {
        
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"You" ofType:@"plist"];
        _controllersArray = [NSArray arrayWithContentsOfFile:filePath];
        
        for (NSDictionary *dict in _controllersArray) {
            
            UIViewController *vc = [NSClassFromString(dict[@"controllerName"]) new];
            vc.title = dict[@"title"];
            
            [self.array addObject:vc];
        }
    }

 
    
    return _controllersArray;
}

- (void) doAction:(UIButton *)button {
    

    
    NSArray *controllersArray = @[@"EatController", @"PlayController", @"WorkController", @"UsingController", @"HelpController"];
    
    [self.navigationController pushViewController:[NSClassFromString(controllersArray[button.tag - 100]) new] animated:YES];
    
}

#pragma 设置UI界面 吃 玩 劳 用 帮
- (void) setupUI {
    
    
    NSArray *titleArray = @[@"吃", @"玩", @"仕", @"用", @"帮"];
//    NSArray *backgroundImage = @[@"背景图片"];
    
    for (NSInteger index = 0 ; index < 5 ; index ++) {
        
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
