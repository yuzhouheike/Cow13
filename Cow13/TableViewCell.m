//
//  TableViewCell.m
//  Cow13
//
//  Created by 王磊磊 on 16/6/8.
//  Copyright © 2016年 风暴科技. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *blackView;


@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
    self.black.height = 5;
    self.black.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
