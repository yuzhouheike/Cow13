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

@end

@implementation YouController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 180);
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 400);
    [self.view addSubview:demoContainerView];
    
    

    //采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
   
    
    CGFloat w = self.view.bounds.size.width;
    
    
    
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
        SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
        cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
        cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
    
        [demoContainerView addSubview:cycleScrollView3];
    

    [self getDataFromSever:@"?service=Wuser.Login&username=test&password=2535262wll" parameter:nil isSuccess:^(NSURLSessionDataTask *task, id project) {
        
        NSLog(@"%@", project);
    } isError:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 如果你发现你的CycleScrollview会在viewWillAppear时图片卡在中间位置，你可以调用此方法调整图片位置
    //    [你的CycleScrollview adjustWhenControllerViewWillAppera];
}


#pragma mark - SDCycleScrollViewDelegate

// 滚动到第几张图回调

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    [self.navigationController pushViewController:[NSClassFromString(@"HeartScrollController") new] animated:YES];
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
