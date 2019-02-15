//
//  UIViewController+Root.m
//  BocKitModule
//
//  Created by 张扬明 on 2019/2/14.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import "UIViewController+Root.h"
#import <objc/runtime.h>
#import "BocKit.h"
static void *dataSourceListKey = &dataSourceListKey;
static void *tableViewKey = &tableViewKey;
static void *pageIndexKey = &pageIndexKey;
static NSMutableArray *_dataSourceList;
@implementation UIViewController (Root)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewDidLoad:[aspectInfo instance] withPosition:AspectPositionBefore];
        } error:nil];
        [self aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewWillAppear:[aspectInfo instance] withPosition:AspectPositionBefore];
        } error:nil];
        [self aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewDidLoad:[aspectInfo instance] withPosition:AspectPositionBefore];
        } error:nil];
        
        [self aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewDidLoad:[aspectInfo instance] withPosition:AspectPositionAfter];
        } error:nil];
        [self aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewWillAppear:[aspectInfo instance] withPosition:AspectPositionAfter];
        } error:nil];
        [self aspect_hookSelector:@selector(viewWillDisappear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
            [self viewDidLoad:[aspectInfo instance] withPosition:AspectPositionAfter];
        } error:nil];
    });
}

- (void)setTableView:(UITableView *)tableView{
    objc_setAssociatedObject(self, tableViewKey, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UITableView *)tableView{
    return objc_getAssociatedObject(self, tableViewKey);
}


- (void)setPageIndex:(NSInteger)pageIndex{
    
    objc_setAssociatedObject(self, pageIndexKey, @(pageIndex), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)pageIndex{
    return [objc_getAssociatedObject(self, pageIndexKey) integerValue];
}

+ (void)viewDidLoad:(UIViewController *)viewController withPosition:(AspectOptions)options{
    if (options == AspectPositionAfter) {
        [viewController configureTableView:UITableViewStylePlain];
        [viewController setupTableView];
        [viewController addRefreshControl];
    }
    NSLog(@"[%@ viewDidLoad]", [viewController class]);
}


+ (void)viewWillAppear:(UIViewController *)viewController withPosition:(AspectOptions)options{
    NSLog(@"[%@ viewWillAppear]",[viewController class]);
    
}


+ (void)viewWillDisappear:(UIViewController *)viewController withPosition:(AspectOptions)options{
    NSLog(@"[%@ viewWillDisappear]",[viewController class]);
    
}

- (void)configureTableView:(UITableViewStyle)style
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenWidth - kNavigationBarHeight) style: style];
    tableView.backgroundColor = [UIColor whiteColor];
    self.tableView = tableView;
}

- (void)setupTableView
{
    self.tableView.rowHeight = 55.0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.whiteColor;
    self.tableView.sectionFooterHeight = 0.1;
    self.tableView.sectionHeaderHeight = 0.1;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    [self.view addSubview: self.tableView];
}

#pragma mark table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceList.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)addRefreshControl{
    [self addHeaderRefresh];
    [self addFooterRefresh];
}

- (void)addHeaderRefresh{
#if __has_include("MJRefresh.h")
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshNewData)];
#endif
}

- (void)addFooterRefresh{
#if __has_include("MJRefresh.h")
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshMoreData)];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    self.tableView.mj_footer = footer;
#endif
}

- (void)refreshNewData{
    self.pageIndex = 1;
    [self refreshDataWithPageIndex:self.pageIndex];
}


- (void)refreshMoreData{
    self.pageIndex += 1;
    [self refreshDataWithPageIndex:self.pageIndex];
}

- (void)refreshDataWithPageIndex:(NSInteger)pageIndex{}

- (NSMutableArray *)dataSourceList{
    if (!_dataSourceList) {
        _dataSourceList = [[NSMutableArray alloc]init];
    }
    return _dataSourceList;
}
@end
