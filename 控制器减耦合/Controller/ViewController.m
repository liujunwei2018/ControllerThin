//
//  ViewController.m
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/5.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewCell.h"
#import "TestTableViewCell+Config.h"
#import "TestTableViewDataSource.h"
#import "TestModel.h"

@interface ViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *items;
// 需要持有一个 TestTableViewDataSource, 如果只是在方法中声明为局部变量,会提前销毁导致无法执行tableView数据源方法
@property (nonatomic, strong) TestTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 对cell 进行配置, 在 TestTableViewDataSource 中调用 cellForRowAtIndexPath 方法时执行
    TableViewCellConfigureBlock cellConfigureBlock = ^(TestTableViewCell *cell, TestModel *model) {
        [cell configCellWithModel:model];
    };
    
    self.dataSource = [[TestTableViewDataSource alloc] initWithItems:self.items cellIdentifier:@"kcellID" cellClass:[TestTableViewCell class] configureCellBlock:cellConfigureBlock];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    // 设置数据源代理为 self.dataSource
    self.tableView.dataSource = self.dataSource;
    
    [self.view addSubview:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d",(int)indexPath.row);
}

- (NSArray *)items {
    if (!_items) {
        TestModel *model0 = [[TestModel alloc] init];
        model0.title = @"0";
        TestModel *model1 = [[TestModel alloc] init];
        model1.title = @"1";
        TestModel *model2 = [[TestModel alloc] init];
        model2.title = @"2";
        TestModel *model3 = [[TestModel alloc] init];
        model3.title = @"3";
        TestModel *model4 = [[TestModel alloc] init];
        model4.title = @"4";
        TestModel *model5 = [[TestModel alloc] init];
        model5.title = @"5";
        TestModel *model6 = [[TestModel alloc] init];
        model6.title = @"6";
        
        _items = @[model0, model1, model2, model3, model4, model5, model6];
    }
    return _items;
}

@end
