//
//  MineModel.h
//  Cow13
//
//  Created by 王磊磊 on 16/6/7.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) bool isSelect;

+ (NSArray *) dataList;

@end
