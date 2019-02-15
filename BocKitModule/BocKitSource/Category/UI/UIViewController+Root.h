//
//  UIViewController+Root.h
//  BocKitModule
//
//  Created by 张扬明 on 2019/2/14.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Root) <UITableViewDataSource,UITableViewDelegate>

- (void)setTableView:(UITableView *)tableView;
- (UITableView *)tableView;

- (void)setPageIndex:(NSInteger)pageIndex;
- (NSInteger)pageIndex;

- (NSMutableArray *)dataSourceList;

@end

NS_ASSUME_NONNULL_END
