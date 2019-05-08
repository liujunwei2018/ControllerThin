//
//  TestTableViewCell+Config.m
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/8.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "TestTableViewCell+Config.h"
#import "TestModel.h"

@implementation TestTableViewCell (Config)

- (void)configCellWithModel:(TestModel *)model {
    self.textLabel.text = model.title;
}
@end
