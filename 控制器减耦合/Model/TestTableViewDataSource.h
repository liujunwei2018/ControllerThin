//
//  TestTableViewDataSource.h
//  控制器减耦合
//
//  Created by 刘君威 on 2019/5/8.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
// 需要导入UIKit ,不然无法使用 <UITableViewDataSource>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

@interface TestTableViewDataSource : NSObject <UITableViewDataSource>

/**
 实例化

 @param anItems 模型数据数组
 @param aCellIdentifier cell复用ID
 @param aCellClass 自定义cell 的类型
 @param aConfigureCellBlock cell配置回调
 */
- (instancetype)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier cellClass:(Class)aCellClass configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

@end

NS_ASSUME_NONNULL_END
