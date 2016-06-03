//
//  BaseViewController.h
//  Cow13
//
//  Created by 王磊磊 on 16/6/3.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"
//#import "Masonry.h"
#import "MJExtension.h"

typedef void (^successBlock)(NSURLSessionDataTask *task,id project);
typedef void (^errorBlock)(NSURLSessionDataTask *task,NSError *error);
@interface AFNetworkingClient : AFHTTPSessionManager

/**
 AFHTTPSessionManager初始化单利
 */
+ (instancetype)sharedClient;


@end

@interface BaseViewController : UIViewController

/**
 AFNetworking进行get请求
 URL:请求地址
 parameter:请求参数
 isSuccess:请求成功返回数据的block
 isError:请求失败返回原因的block
 */
- (void)getDataFromSever:(NSString *)URL
               parameter:(NSDictionary *)parameter
               isSuccess:(successBlock)success
                 isError:(errorBlock)errorblock;

/**
 AFNetworking进行post请求
 URL:请求地址
 parameter:请求参数
 isSuccess:请求成功返回数据的block
 isError:请求失败返回原因的block
 */
- (void)postDataFromSever:(NSString *)URL
                parameter:(NSDictionary *)parameter
                isSuccess:(successBlock)success
                  isError:(errorBlock)isError;

/**
 UIView展示提示框
 tostString:要提示的文字
 */
- (void)showTostView:(NSString *)tostString;


/**
 返回按钮
 */
- (void)addBackButtonOnNav;

@end
