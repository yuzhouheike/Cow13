//
//  MineController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "MineController.h"
#import "MineModel.h"

static BOOL isLogin = NO;

@interface MineController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIView *view;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    
    if (isLogin) {
        [self setUpTableView];
    } else {
        
        NSLog(@"退出" );
    }
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    isLogin = !isLogin;

    if (isLogin) {
        [self setUpTableView];
    } else {
        
        NSLog(@"退出" );
    }
}

#pragma setUpTableView 

- (void) setUpTableView {
    
    [self.view addSubview:self.tableView];
}

#pragma dataList 

- (NSArray *)dataList {
    
    if (!_dataList) {
        
        _dataList = [MineModel dataList];
        
    }
    
    return _dataList;
}


#pragma tableView

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellMineID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataList[section] count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellMineID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellMineID"];
        MineModel *model = self.dataList[indexPath.section][indexPath.row];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;//cell select style
        cell.textLabel.text = model.title;
        cell.detailTextLabel.text = model.desc;
        cell.imageView.image = [UIImage imageNamed:model.icon];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MineModel *model = self.dataList[indexPath.section][indexPath.row];
    
    NSLog(@"%@ title %@", @(indexPath.row), model.title);
}

@end
