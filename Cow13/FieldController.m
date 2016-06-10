//
//  FieldController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "FieldController.h"
#import "SDCycleScrollView.h"
#import "MineModel.h"
#import "CicleController.h"

static CGFloat kWidth = 36;
static CGFloat kMargin = 10;
static NSString *identifier = @"collectionCellID";

@interface FieldController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) UIButton *findButton;
@property (nonatomic, strong) UIButton *mineButton;
@property (nonatomic, strong) UIButton *buttonView;
@property (nonatomic, strong) UIView *lineView;



@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation FieldController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setUpScrollViewImage];

    [self setUpNav];
    
    [self setUpUi];
    
}

- (void) setUpUi {
    
    
    [self.view addSubview:self.scrollview];
    UILabel *lable = [[UILabel alloc] init];
    
    lable.text = @"⎮附近的领土";
    lable.frame = CGRectMake(0, 110, self.view.width, 20);
    lable.textColor = [UIColor blackColor];
    [self.scrollview addSubview:lable];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, lable.y + lable.height + kMargin, self.view.width, 150);
    imageView.backgroundColor = [UIColor yellowColor];
    [self.scrollview addSubview:imageView];
    
    UILabel *lable2 = [[UILabel alloc] init];
    lable2.textColor = [UIColor blackColor];
    lable2.text = @"⎮最强领土";
    lable2.frame = CGRectMake(0, 110, self.view.width, 20);
    lable2.y = imageView.height + imageView.y + kMargin;
    
    [self.scrollview addSubview:lable2];
    NSArray *titleArray = @[@"吃喝Bang", @"颜值Jie", @"壕Quan", @"会玩Cheng", @"情感Ju", @"综艺Ka", @"科技Kong", @"文艺Fan", @"爱车Zu"];
    NSArray *imageArray = @[@"吃喝", @"颜值", @"壕", @"会玩", @"情感", @"综艺", @"科技", @"文艺", @"爱车"];
    
    CGFloat x;
    CGFloat y;
    CGFloat width = (self.view.width - 4.0 * kMargin) / 3;
    
    CGFloat height  = width;
    
    for (NSInteger i = 0; i < 6 ; i ++) {
        
        x = kMargin * (i + 1) + i * width;
        
        if (i < 3) {
            y = lable2.y + lable2.height + kMargin;
            
        } else {
            x = kMargin * (i % 3 + 1) + i % 3 * width;
            
            y = lable2.y + lable2.height + 2 * kMargin + width + 50;
        }
        
        UIButton *indexButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        indexButton.tag = 100 + i;
        indexButton.titleEdgeInsets = UIEdgeInsetsMake(100, 0, 0, 0);
        indexButton.backgroundColor = [UIColor yellowColor];
        
        indexButton.frame = CGRectMake(x, y, width, height);
        
        [indexButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [indexButton setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [indexButton setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        
        [indexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        indexButton.titleEdgeInsets = UIEdgeInsetsMake(100, -50, -35, 0);
        [indexButton addTarget:self action:@selector(ClickbuttonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:indexButton];
        
    }
    
    
    UILabel *lable3 = [[UILabel alloc] init];
    lable3.textColor = [UIColor blackColor];
    lable3.text = @"⎮每日精选";
    lable3.frame = CGRectMake(0, 60, self.view.width, 20);
    lable3.y = 650;
    
    [self.scrollview addSubview:lable3];
    
    
    
    for (NSInteger i = 6; i < 9 ; i ++) {
        
        x = kMargin * (i + 1) + i * width;
        
        if (i < 3) {
            y = lable3.y + lable3.height + kMargin;
            
        } else {
            x = kMargin * (i % 3 + 1) + i % 3 * width;
            
            y = lable3.y + lable3.height + kMargin ;
        }
        
        UIButton *indexButton = [UIButton buttonWithType:UIButtonTypeCustom];
        indexButton.tag = 100 + i;
        indexButton.titleEdgeInsets = UIEdgeInsetsMake(100, -50, -35, 0);
        indexButton.backgroundColor = [UIColor yellowColor];
        
        UILabel *lable = [[UILabel alloc] init];
        lable.frame = CGRectMake(indexButton.x, 0, indexButton.width, 2);
        lable.text = titleArray[i];
        [indexButton addSubview:lable];
        
        indexButton.frame = CGRectMake(x, y, width, height);
        
        [indexButton setTitle:titleArray[i] forState:UIControlStateNormal];
        [indexButton setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [indexButton setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        
        [indexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [indexButton addTarget:self action:@selector(ClickbuttonMethod:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollview addSubview:indexButton];
        
    }

}

- (UIScrollView *)scrollview {
    
    if (!_scrollview ) {
        _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollview.backgroundColor = RGB(235, 235, 241);
        _scrollview.contentSize = CGSizeMake(self.view.width, 2*self.view.height);
    }
    
    return _scrollview;
}


- (void) setUpNav {
    
    [self.navigationController.navigationBar addSubview:self.findButton];
    [self.navigationController.navigationBar addSubview:self.mineButton];
    [self.navigationController.navigationBar addSubview:self.lineView];
}
- (void) findAndMineMethods:(UIButton *) button{
    
    NSLog(@"%@", button.currentTitle);

    [UIView animateWithDuration:0.01 animations:^{
        
        self.lineView.x = button.x;
    }];
}

#pragma mark -lineView 

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(self.view.width/2.0 - 5 - kWidth, kWidth , kWidth, 3);
        _lineView.backgroundColor = [UIColor whiteColor];

    }
    return _lineView;
}

#pragma mark -我的

- (UIButton *)mineButton {
    
    if (!_mineButton) {
        _mineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mineButton setTitle:@"我的" forState:UIControlStateNormal];
        [_mineButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mineButton addTarget:self action:@selector(findAndMineMethods:) forControlEvents:UIControlEventTouchUpInside];
        _mineButton.frame = CGRectMake(self.view.width/2.0  + 5, 0, kWidth, kWidth);
    }
    return _mineButton;
}

#pragma mark -发现

- (UIButton *)findButton {
    
    if (!_findButton) {
        _findButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_findButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        [_findButton setTitle:@"发现" forState:UIControlStateNormal];
        [_findButton setFrame:CGRectMake(self.view.width/2.0  - 5  - kWidth , 0,kWidth , kWidth)];
        
        [_findButton addTarget:self action:@selector(findAndMineMethods:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _findButton;
}



#pragma mark -我的

- (void)setUpScrollViewImage {
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 190);
    UIScrollView *ContainerView = [[UIScrollView alloc] initWithFrame:frame];
    ContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
//    [self.view addSubview:ContainerView];
    [self.scrollview addSubview:ContainerView];
    
//    self.collectionView
    
    NSArray *imagesURLStrings = @[
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                  @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1465197458&di=15d1f6adbf8504d76a2106727ea6d88f&src=http://pic1a.nipic.com/2008-11-26/200811269238739_2.jpg",
                                  @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1465197458&di=ec3418b68877e8652f830f6f422567b3&src=http://img15.3lian.com/2015/f3/16/d/30.jpg"
                                  ];

    CGFloat w = self.view.bounds.size.width;
    
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 100) delegate:self placeholderImage:[UIImage imageNamed:@"背景图片"]];
    
    cycleScrollView2.currentPageDotColor = [UIColor grayColor]; // 自定义分页控件小圆标颜色
    [ContainerView addSubview:cycleScrollView2];
    
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    
    
    
}



#pragma mark - SDCycleScrollViewDelegate

// 滚动到第几张图回调

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"HeartScrollController") new] animated:NO];
}





- (void) ClickbuttonMethod:(UIButton *)button {
    
    [self.navigationController pushViewController:[CicleController new] animated:YES];
}



@end
