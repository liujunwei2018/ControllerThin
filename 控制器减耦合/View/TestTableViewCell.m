//
//  TestTableViewCell.m
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/8.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
