//
//  TestTableViewDataSource.m
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/8.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "TestTableViewDataSource.h"

@interface TestTableViewDataSource ()
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
// 获得 cell 类名称,这样就不需要导入 TestTableViewCell.h
@property (nonatomic, strong) Class cls;

@end

@implementation TestTableViewDataSource

- (instancetype)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier cellClass:(Class)aCellClass configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    if (self = [super init]) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.cls = aCellClass;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.items && self.items.count > 0 && ![self.items isKindOfClass:[NSNull class]]) {
        return self.items.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        // 创建 self.cls 类型的 cell
        cell = [[self.cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    id item = self.items[indexPath.row];
    // 执行配置cell的方法(分类中)
    self.configureCellBlock(cell, item);
    
    return cell;
}


@end
