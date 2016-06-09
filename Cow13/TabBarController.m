//
//  TabBarController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "CustomTabbar.h"
@interface TabBarController ()

@property (nonatomic, strong) NSArray *cotrollerArray;

@end

@implementation TabBarController

#pragma cotrollerArray tabbar 的 controller 数组

- (NSArray *)cotrollerArray {
    
    if (!_cotrollerArray) {
        _cotrollerArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Controllers" ofType:@"plist"]];
    }
    
    return _cotrollerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"%@", self.cotrollerArray);
    
    NSMutableArray *controllersArray = [NSMutableArray arrayWithCapacity:self.cotrollerArray.count];
    
    for (NSDictionary *dict in self.cotrollerArray) {
        
        Class viewControllerClass = NSClassFromString(dict[@"ControllerName"]);
        
        UIViewController *viewController = [[viewControllerClass alloc] init];
        
        viewController.navigationItem.title = dict[@"ControllerTitle"];
        
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"TabbarSelectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        viewController.tabBarItem.image = [[UIImage imageNamed:dict[@"TabbarSelectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        NavigationController *navigationtroller = [[NavigationController alloc] initWithRootViewController:viewController];
        
        [controllersArray addObject:navigationtroller];
      
    }
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : RGB(65, 179, 241)} forState:(UIControlStateSelected)];
    
    self.viewControllers = controllersArray;
    
     self.selectedIndex = 1;//默认就是0
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"nav_backImage"];
//    self.tabBar.backgroundColor = RGB(255, 255, 255);
//    self.tabBar.backgroundColor = [UIColor blackColor];
    
    [self setValue:[CustomTabbar new] forKey:@"tabBar"];
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
