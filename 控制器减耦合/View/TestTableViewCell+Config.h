//
//  TestTableViewCell+Config.h
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/8.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "TestTableViewCell.h"
@class TestModel;
NS_ASSUME_NONNULL_BEGIN

@interface TestTableViewCell (Config)

- (void)configCellWithModel:(TestModel *)model;
@end

NS_ASSUME_NONNULL_END
