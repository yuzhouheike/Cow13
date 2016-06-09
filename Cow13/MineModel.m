
//
//  MineModel.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/7.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "MineModel.h"
#import "MineModel.h"
@implementation MineModel


+ (instancetype) mineModelWithDict : (NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}


- (instancetype) initWithDict:(NSDictionary *) dict {
    
    if(self = [super init])
    {
//        [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.desc = dict[@"desc"];
        self.isSelect = dict[@"isSelect"];
    }
    return self;
}

+ (NSArray *)dataList {
    
    NSArray *arrays = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Mine" ofType:@"plist"]];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (NSArray *array in arrays) {
        
        NSMutableArray *dataMutableArray = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            MineModel *model = [MineModel new];
            model = [model initWithDict:dict];
            [dataMutableArray addObject:model];
            
        }
        
        [mutableArray addObject:dataMutableArray];
    }
    
    
    return mutableArray;
    
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {

}

- (NSString *)description
{
    return [NSString stringWithFormat:@"title : %@ icon : %@ desc : %@", self.title, self.icon, self.desc];
}

@end
