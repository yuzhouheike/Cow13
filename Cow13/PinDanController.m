//
//  PinDanController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/10.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "PinDanController.h"
#import "SDCycleScrollView.h"
#import "PinDanCell.h"
#import "PinDanDetailController.h"
@interface PinDanController ()<SDCycleScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PinDanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpScrollViewImage];
    
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 270;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PinDanCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%@", indexPath);
    
    [self.navigationController pushViewController:[PinDanDetailController new] animated:YES];
}

- (UITableView *)tableView {
    
    if(!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PinDanCell class]) bundle:nil] forCellReuseIdentifier:identifer];
    }
    
    return _tableView;
}

#pragma mark 轮播图

- (void)setUpScrollViewImage {
    
    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 150);
    // 添加轮播图
    UIScrollView *ContainerView = [[UIScrollView alloc] initWithFrame:frame];
    ContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
//    [self.view addSubview:ContainerView];
    self.tableView.tableHeaderView = ContainerView;
    
    
    
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
    
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 150) delegate:self placeholderImage:[UIImage imageNamed:@"背景图片"]];
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.titlesGroup = titles;
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [ContainerView addSubview:cycleScrollView];
    
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
    
    
}



@end
