//
//  CustomTabbar.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "CustomTabbar.h"
#import "PublichController.h"
#import "NavigationController.h"
#import "POP.h"
static CGFloat buttonLength = 80;

@interface CustomTabbar ()

/** 发布按钮 */
@property (nonatomic, weak) UIButton *publishButton;

@property (nonatomic, strong) NSMutableArray *mutableButtonArray;

@property (nonatomic, strong) NSArray *temp;

// 蒙版效果
@property (nonatomic, strong) UIView *myView;

@property (nonatomic, strong) UIButton *technologyButton;
@property (nonatomic, strong) UIButton *requireButton;
@property (nonatomic, strong) UIButton *productButton;

@property (nonatomic, assign) CGPoint point;


@end

@implementation CustomTabbar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
        

        
        // 添加发布按钮
        self.point = CGPointMake(212 - 24.5, 608.3 + 24.5);
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"publishicon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"pubishclickicon"] forState:UIControlStateHighlighted];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"pubishclickicon"] forState:UIControlStateSelected];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton = publishButton;
//        self.backgroundColor = RGB(255, 255, 255);
        self.backgroundColor = [UIColor blackColor];
    }
    
    
    
    return self;
}

- (NSArray *)temp {
    
    if (!_temp) {
        _temp = @[@1,@0,@0,@0];
    }
    return _temp;
    
}


#pragma mark pop动画
- (void) publishClick {
    
    
    
    self.publishButton.selected = !self.publishButton.selected;
    
    
    
    

    self.myView.alpha = 0;

    
    [[UIApplication sharedApplication].keyWindow addSubview:self.myView];
   
    if (self.publishButton.selected == 1) {
        
        self.myView.alpha = 0.8;
        
        /**
         *  发布技能
         */
         POPSpringAnimation *technologyAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.technologyButton];
        technologyAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        technologyAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 300)];
        self.technologyButton.backgroundColor = [UIColor orangeColor];
        technologyAnim.springBounciness = 20;
        technologyAnim.springSpeed = 20;
        [self.technologyButton pop_addAnimation:technologyAnim forKey:@"center"];
        
        
        /**
         *  发布需求
         */
        POPSpringAnimation *requireAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.requireButton];
        self.requireButton.backgroundColor = [UIColor orangeColor];
        requireAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        requireAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 400)];
        self.requireButton.backgroundColor = [UIColor orangeColor];
        requireAnim.springBounciness = 20;
        requireAnim.springSpeed = 20;
        [self.requireButton pop_addAnimation:requireAnim forKey:@"center"];
        
        /**
         *  发布产品
         */
        POPSpringAnimation *productAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.productButton];
        self.productButton.backgroundColor = [UIColor orangeColor];
        productAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        productAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 500)];
        self.productButton.backgroundColor = [UIColor orangeColor];
        productAnim.springBounciness = 20;
        productAnim.springSpeed = 20;
        [self.productButton pop_addAnimation:productAnim forKey:@"center"];
        
    } else {
        
        POPSpringAnimation *technologyAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.technologyButton];
        technologyAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        technologyAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 800)];
        self.technologyButton.backgroundColor = [UIColor orangeColor];
        technologyAnim.springBounciness = 20;
        technologyAnim.springSpeed = 20;
        [self.technologyButton pop_addAnimation:technologyAnim forKey:@"center"];
        
        
        /**
         *  发布需求
         */
        POPSpringAnimation *requireAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.requireButton];
        self.requireButton.backgroundColor = [UIColor orangeColor];
        requireAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        requireAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 800)];
        self.requireButton.backgroundColor = [UIColor orangeColor];
        requireAnim.springBounciness = 20;
        requireAnim.springSpeed = 20;
        [self.requireButton pop_addAnimation:requireAnim forKey:@"center"];
        
        /**
         *  发布产品
         */
        POPSpringAnimation *productAnim = [POPSpringAnimation animation];
        [self.myView addSubview:self.productButton];
        self.productButton.backgroundColor = [UIColor orangeColor];
        productAnim.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
        productAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(375/2.0, 800)];
        self.productButton.backgroundColor = [UIColor orangeColor];
        productAnim.springBounciness = 20;
        productAnim.springSpeed = 20;
        [self.productButton pop_addAnimation:productAnim forKey:@"center"];
        

        
        self.alpha = 1;

    }
    
    
    
  

}

- (UIView *)myView {
    
    if (!_myView) {
        _myView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
        _myView.backgroundColor = [UIColor blackColor];
        
      
    }
    return _myView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 标记按钮是否已经添加过监听器
    static BOOL added = NO;
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.2);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIControl *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
        
        button.tag = 100 + index;
        
        if (added == NO) {
            // 监听按钮点击
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
       
            [self.mutableButtonArray addObject:button];
            
        }
    }
    
    added = YES;
}

- (NSMutableArray *)mutableButtonArray {
    
    if (!_mutableButtonArray) {
        _mutableButtonArray = [NSMutableArray array];
        
    }
    
    return _mutableButtonArray;
}

- (void)buttonClick:(UIButton *)button
{

    int index = (int)button.tag - 100 -1;
    
    
    
    for (NSInteger i = 0; i < 4 ; i ++) {
        
       UIButton *wll =  self.mutableButtonArray[i];
        
        if (index == i) {
            wll.y = -10;
        }else {
            wll.y =0;
        }
    }
    

}

- (UIButton *)technologyButton {
    
    if (!_technologyButton) {
        _technologyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_technologyButton setTitle:@"发布技能" forState:UIControlStateNormal];
        [_technologyButton setTitle:@"发布技能" forState:UIControlStateHighlighted];
        [_technologyButton setBackgroundImage:[UIImage imageNamed:@"发布技能"] forState:UIControlStateNormal];
        [_technologyButton setBackgroundImage:[UIImage imageNamed:@"发布技能"] forState:UIControlStateHighlighted];
        _technologyButton.layer.cornerRadius = buttonLength / 2.0;
        _technologyButton.titleEdgeInsets = UIEdgeInsetsMake(buttonLength, 0, 0, 0);
        _technologyButton.size = CGSizeMake(buttonLength, buttonLength);
       
        _technologyButton.center = self.point;
        
        [_technologyButton addTarget:self action:@selector(publicMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _technologyButton;
}

- (UIButton *)requireButton {
    if (!_requireButton) {
        _requireButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        _requireButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _requireButton.titleEdgeInsets = UIEdgeInsetsMake(buttonLength, 0, 0, 0);
        [_requireButton setTitle:@"发布需求" forState:UIControlStateNormal];
        [_requireButton setTitle:@"发布需求" forState:UIControlStateHighlighted];
        [_requireButton setBackgroundImage:[UIImage imageNamed:@"发布需求"] forState:UIControlStateNormal];
        [_requireButton setBackgroundImage:[UIImage imageNamed:@"发布需求"] forState:UIControlStateHighlighted];
        _requireButton.layer.cornerRadius = buttonLength / 2.0;
        _requireButton.size = CGSizeMake(buttonLength, buttonLength);
        _requireButton.center = self.point;
        [_requireButton addTarget:self action:@selector(publicMethod:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _requireButton;
}

- (UIButton *)productButton {
    if (!_productButton) {
        _productButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _productButton.titleEdgeInsets = UIEdgeInsetsMake(buttonLength, 0, 0, 0);
        [_productButton setTitle:@"发布产品" forState:UIControlStateNormal];
        [_productButton setTitle:@"发布产品" forState:UIControlStateHighlighted];
        [_productButton setBackgroundImage:[UIImage imageNamed:@"发布产品"] forState:UIControlStateNormal];
        [_productButton setBackgroundImage:[UIImage imageNamed:@"发布产品"] forState:UIControlStateHighlighted];
        _productButton.layer.cornerRadius = buttonLength / 2.0;
        _productButton.size = CGSizeMake(buttonLength, buttonLength);
        _productButton.center = self.publishButton.center;
        
        [_productButton addTarget:self action:@selector(publicMethod:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _productButton;
}

- (void) publicMethod : (UIButton *) button {
    
    NSLog(@"%@", button.currentTitle);
    
    if ([button.currentTitle isEqualToString:@"发布技能" ]) {
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[NSClassFromString(@"TechnologyController") new
                                                                                               ] animated:YES completion:nil];
    } else if ([button.currentTitle isEqualToString:@"发布需求"]) {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[NSClassFromString(@"RequireController") new
                                                                                               ] animated:YES completion:nil];
    } else if ([button.currentTitle isEqualToString:@"发布产品"]) {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[NSClassFromString(@"ProductController") new
                                                                                               ] animated:YES completion:nil];
    }
}



@end
