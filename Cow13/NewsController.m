//
//  NewsController.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/10.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "NewsController.h"

@interface NewsController ()
@property (weak, nonatomic) IBOutlet UIWebView *news;

@end

@implementation NewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"新闻页面❤️";
    NSURL *url = [NSURL URLWithString:@"http://apple.baijia.baidu.com/article/490808"];
    [self.news loadRequest:[NSURLRequest requestWithURL:url]];

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
