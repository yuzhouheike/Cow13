//
//  UsingController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/9.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "UsingController.h"

@interface UsingController ()<SDCycleScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *array;
@end

@implementation UsingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollViewImage];
    
    [self.view addSubview:self.tableView];
    
}

- (UITableView *)tableView {
    
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellcell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EatCell class]) bundle:nil] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}

- (void)setUpScrollViewImage {
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 190);
    // 添加轮播图
    UIScrollView *ContainerView = [[UIScrollView alloc] initWithFrame:frame];
    ContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    [self.view addSubview:ContainerView];
    
    
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"http://img2.imgtn.bdimg.com/it/u=1532086082,2477988054&fm=21&gp=0.jpg",
                                  @"http://img3.imgtn.bdimg.com/it/u=2338594730,2844846173&fm=21&gp=0.jpg",
                                  @"http://img0.imgtn.bdimg.com/it/u=4008394954,1766932938&fm=21&gp=0.jpg",
                                  @"http://img5.imgtn.bdimg.com/it/u=239586495,3188033768&fm=21&gp=0.jpg",
                                  @"http://img1.imgtn.bdimg.com/it/u=3776425057,3726672988&fm=21&gp=0.jpg"
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableView

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return cellLines;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *section = @[@"生活用品", @"科技用品"];
    
    if (indexPath.row == 0) {
        
        
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:self.view.bounds];
        cell.textLabel.text = section[indexPath.section];
        cell.textLabel.font = [UIFont systemFontOfSize:40];
        cell.textLabel.textAlignment = NSTextAlignmentJustified;
        cell.imageView.image = [UIImage imageNamed:@"爱车"];
        ;
        
        return cell;
        
    } else{
        
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        
        return cell;
        
    }
    
}

- (NSArray *)array {
    if (!_array) {
        
    }
    
    return _array;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", indexPath.row);
    
    [self.navigationController pushViewController:[NSClassFromString(@"EatGoodsController") new] animated:YES];
}

@end
