//
//  MessageController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "MessageController.h"
#import "TableViewCell.h"
@interface MessageController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;


@end

@implementation MessageController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)array {
    
    if (!_array) {
        _array = @[@"评论",@"留言",@"我的赞"
                   ];
    }
    
    return _array;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        
    }
    
    return _tableView;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *blackView = [[UIView alloc] init];
    
    if (section!=2) {
        
        blackView.bounds = CGRectMake(0, 0, self.view.width, 2);
        
        blackView.backgroundColor = [UIColor blackColor];
    }

    
    return blackView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
        
        cell.textLabel.text = self.array[indexPath.section];
//        cell.black.frame = CGRectMake(0, 0, self.view.width, 20);
//        cell.black.backgroundColor = [UIColor redColor];
        cell.imageView.image = [UIImage imageNamed:self.array[indexPath.section]];
        cell.backgroundColor = RGB(208, 208, 208);
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    return cell;
}

#pragma mark 评论留言我的赞三个点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = @[@"CommentsController",@"LeveWorldController",@"MyPriseController"];
    
    [self.navigationController pushViewController:[NSClassFromString(array[indexPath.section]) new] animated:YES];
}


@end
