//
//  CustomServiceController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/6.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "CustomServiceController.h"



@interface CustomServiceController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CustomServiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"服务站";
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifer];
    }
    
    return _tableView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
        label.numberOfLines = 0;
        
        label.text = @"📣📣📣📣📣📣企业公告所宣布的事项是社会有关方面或人民群众对企业极为关注的重大事项，所宣布的内容是能够向社会公开的重大决定，在社会上可能产生重大影响。如上市公司的公告将对股民产生重大影响。";
        return label;
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section < 2) {
        return 100;
    }
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = @[@"官方公告", @"私人公告", @"官方客服:13264090401", @"私人客服:0451-2610874"];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (indexPath.section == 3 || indexPath.section ==2) {

        cell.textLabel.textAlignment = NSTextAlignmentRight;
    }

    
    cell.textLabel.text = array[indexPath.section];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        NSLog(@"%@", @(13264090401));
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"13264090401"];
        UIWebView * callWebview = [[UIWebView alloc] init];
        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [self.view addSubview:callWebview];

    }
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
