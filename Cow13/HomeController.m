//
//  HomeController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "HomeController.h"
#import "SDCycleScrollView.h"
#import "YouController.h"
#import "HeartController.h"
#import "LifeController.h"
#import "MultitedChipController.h"
#import "CustomServiceController.h"
#import "ForumController.h"
#import "PreferentialController.h"

@interface HomeController ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *You;
@property (weak, nonatomic) IBOutlet UIButton *Life;
@property (weak, nonatomic) IBOutlet UIButton *Talk;
@property (weak, nonatomic) IBOutlet UIButton *multitude;
@property (weak, nonatomic) IBOutlet UIButton *heart;
@property (weak, nonatomic) IBOutlet UIButton *preferential;
@property (weak, nonatomic) IBOutlet UIButton *customService;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置滚动视图
    [self setUpScrollViewImage];
    
    [self setCicle];
}

- (void) setCicle {
    
    self.You.layer.cornerRadius = 10;
    
    self.You.layer.masksToBounds = YES;
    
    self.Life.layer.cornerRadius = 10;
    
    self.Life.layer.masksToBounds = YES;
    
    self.Talk.layer.cornerRadius = 10;
    
    self.Talk.layer.masksToBounds = YES;
    
    self.multitude.layer.cornerRadius = 10;
    
    self.multitude.layer.masksToBounds = YES;
    
    self.heart.layer.cornerRadius = 10;
    
    self.heart.layer.masksToBounds = YES;
    
    self.preferential.layer.cornerRadius = 10;
    
    self.preferential.layer.masksToBounds = YES;
    
    self.customService.layer.cornerRadius = 10;
    
    self.customService.layer.masksToBounds = YES;
}
- (void)setUpScrollViewImage {
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 190);
    // 添加轮播图
    UIScrollView *ContainerView = [[UIScrollView alloc] initWithFrame:frame];
    ContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    [self.view addSubview:ContainerView];
    
    
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                  @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1465197458&di=15d1f6adbf8504d76a2106727ea6d88f&src=http://pic1a.nipic.com/2008-11-26/200811269238739_2.jpg",
                                  @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1465197458&di=ec3418b68877e8652f830f6f422567b3&src=http://img15.3lian.com/2015/f3/16/d/30.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"新建交流QQ：26108724 ",
                        @"感谢您的支持，如果下载的",
                        @"如果使用过程中出现问题",
                        @"您可以发邮件到26108724@qq.com",
                        @"请联系我们:cow13"
                        ];
    
    CGFloat w = self.view.bounds.size.width;
    
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"背景图片"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [ContainerView addSubview:cycleScrollView2];
    
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    
    
    
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
    
    [self.navigationController pushViewController:[NSClassFromString(@"HeartScrollController") new] animated:NO];
}
- (IBAction)knowYou:(id)sender {
    
    
    [self.navigationController pushViewController:[YouController new] animated:NO];
    
}
- (IBAction)Knowheart:(id)sender {
    
    
    [self.navigationController pushViewController:[HeartController new] animated:NO];
}
- (IBAction)knowLife:(id)sender {
    
    
    [self.navigationController pushViewController:[LifeController new] animated:NO];
}
- (IBAction)forum:(id)sender {
    
    
    [self.navigationController pushViewController:[ForumController new] animated:NO];
}
- (IBAction)preferential:(id)sender {
    
    
    [self.navigationController pushViewController:[PreferentialController new] animated:NO];
}
- (IBAction)customService:(id)sender {
    
    
    [self.navigationController pushViewController:[CustomServiceController new] animated:NO];
}
- (IBAction)multitudeChip:(id)sender {
    
    
    [self.navigationController pushViewController:[MultitedChipController new] animated:NO];
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
