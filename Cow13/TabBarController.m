//
//  TabBarController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"

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
    
    NSLog(@"%@", self.cotrollerArray);
    
    NSMutableArray *controllersArray = [NSMutableArray arrayWithCapacity:self.cotrollerArray.count];
    
    for (NSDictionary *dict in self.cotrollerArray) {
        
        Class viewControllerClass = NSClassFromString(dict[@"ControllerName"]);
        
        UIViewController *viewController = [[viewControllerClass alloc] init];
        
        viewController.title = dict[@"ControllerTitle"];
        
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"TabbarSelectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        viewController.tabBarItem.image = [[UIImage imageNamed:dict[@"TabbarDiselectImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        NavigationController *navigationtroller = [[NavigationController alloc] initWithRootViewController:viewController];
        
        [controllersArray addObject:navigationtroller];
      
    }
    
    self.viewControllers = controllersArray;
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
