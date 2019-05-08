# ControllerThin
控制器瘦身

csdn: https://blog.csdn.net/ljw2017/article/details/89950541

主要内容

        在使用 tableView 视图的控制器中, 需要实现 UITableViewDelegate 和 UITableViewDataSource , 本文主要说明了如何将 UITableViewDataSource 相关方法从 ViewController 中分离开,以及让TableViewCell 和 模型分离。

实现思路

创建一个继承NSObject的类,实现 UITableViewDataSource 相关数据源方法 
提供实例化方法,能够获取模型数据,cell复用ID,自定义 cell类,提供回调block配置cell
创建自定义cell 的分类,提供方法接收模型,配置cell 显示数据
控制器中tableView.dataSource 设置为上述实现 UITableViewDataSource 的类
控制器中调用cell分类提供的方法将model 赋值给cell
代码说明
目录



1.Model 层

TestModel: 简单的声明了一个title属性, 如果控制器有一些逻辑操作,也可以剥离到Model中

TestTableViewDataSource.h:  声明了一个实例化方法



TestTableViewDataSource.m: 实现 UITableViewDataSource 数据源方法, cellClass 接收自定义cell 类名([TestTableViewCell class]), 这样做是为了创建该cell, 但是配置cell内容是在分类中,不需要在 TestTableViewDataSource 中配置,所以这样可以不用 #import "TestTableViewCell.h" 



这里回调 self.congfigureCellBlock(cell, item), 在控制器中会执行该block具体内容



2.View层

TestTableViewCell: 自定义cell (在该demo中未自定义相关控件)

TestTableViewCell+Config.h:  声明一个接收 model 的方法



TestTableViewCell+Config.m:  对cell 属性赋值



3.ViewController 层

将self.tableView.dataSource 设置为 TestTableViewDataSource 的实例, 控制器不需要实现 UITableViewDataSource 相关方法


