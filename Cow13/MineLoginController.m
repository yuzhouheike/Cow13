//
//  MineLoginController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/7.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "MineLoginController.h"
#import "MineModel.h"
#import "PleaseLoginController.h"

static BOOL isLogin = YES;

@interface MineLoginController ()<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *sectionFootView;


@end

@implementation MineLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    if (isLogin) {
        [self setUpTableView];
    } else {
        
        NSLog(@"退出" );
    }

    
}

#pragma mark 登录前headView

- (UIView *)headView {
    
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
        _headView.backgroundColor = defaultBcakgroundcolor;
        
        
        
        UIButton *pleaseLoginImage = [UIButton  buttonWithType:UIButtonTypeSystem];
        [pleaseLoginImage setBackgroundImage:[UIImage imageNamed:@"icon1"] forState:UIControlStateNormal];
        pleaseLoginImage.frame = CGRectMake(10, 10, 80, 80);
        pleaseLoginImage.userInteractionEnabled = YES;
        pleaseLoginImage.layer.cornerRadius = 40;
        pleaseLoginImage.layer.masksToBounds = YES;
        pleaseLoginImage.enabled = NO;
        
        UIButton *pleaseLogin = [UIButton buttonWithType:UIButtonTypeSystem];
        [pleaseLogin setFrame:CGRectMake(100, 25, 100, 50)];
        [pleaseLogin setTitle:@"宇宙黑客" forState:UIControlStateNormal];
        pleaseLogin.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
        [pleaseLogin setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
        pleaseLogin.enabled = NO;
        
        UIButton *userManger = [UIButton buttonWithType:UIButtonTypeSystem];
        [userManger setTitle:@"账户管理" forState:UIControlStateNormal];
        [userManger setTitle:@"账户管理" forState:UIControlStateHighlighted];
        [userManger setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [userManger setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        userManger.frame = CGRectMake(self.view.width - 100, 25, 100, 50);
        [userManger addTarget:self action:@selector(userMangerMethod) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:userManger];
        [_headView addSubview:pleaseLogin];
        [_headView addSubview:pleaseLoginImage];
    }
    
    return _headView;
}


#pragma mark 尾部 高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 70;
    } else if (section == 5) {
        return 200;
    }
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return self.sectionFootView;
    }else if (section == 5) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
        if (section == 5) {
            
            view.backgroundColor = defaultBcakgroundcolor;
        }
        return view;
    }

    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return self.headView;
    }
    
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    isLogin = !isLogin;
    
 
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
        _tableView.tableHeaderView = self.headView;
        _tableView.showsVerticalScrollIndicator = NO;
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

#pragma mark sectionFootView 四个button一列


- (UIView *)sectionFootView {
    
    NSArray *titles = @[@"待付款", @"待使用", @"待评价", @"退款售后"];
    
    UIView *blackLine = [[UIView alloc] initWithFrame:CGRectMake(20, 0, self.view.width - 40, 1)];
    blackLine.backgroundColor = defaultBcakgroundcolor;
    CGFloat kMargin = 30;
    CGFloat y = 5;
    CGFloat width = (self.view.width - 5 * kMargin) / 4.0;
    CGFloat height = width;
    if (!_sectionFootView) {
        _sectionFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 25)];
        _sectionFootView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        
        for (NSInteger i = 0; i < 4; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button setTitle:titles[i] forState:UIControlStateHighlighted];
            [button setImage:[UIImage imageNamed:titles[i]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:titles[i]] forState:UIControlStateHighlighted];
            button.frame = CGRectMake( i * width + (i + 1)*kMargin, y, width, height);
            button.imageEdgeInsets = UIEdgeInsetsMake(-20, 15, 0, 0);
            
            button.titleEdgeInsets = UIEdgeInsetsMake(30, -20, 0, 0);
            
            
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            
            button.tag = 100 + i;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            [_sectionFootView addSubview:button];
            [_sectionFootView addSubview:blackLine];
        }
    }
    return _sectionFootView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) userMangerMethod {
    
    NSLog(@"用户管理");
}





@end
