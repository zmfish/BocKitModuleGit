//
//  Theme.h
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Theme : NSObject
//以下为设定的默认值
@property (nonatomic, strong) UIColor *textTitleColor;//000000

@property (nonatomic, strong) UIColor *textBlackColor;//333333

@property (nonatomic, strong) UIColor *textRedColor;//E12219

@property (nonatomic, strong) UIColor *textLightRedColor;//E93427

@property (nonatomic, strong) UIColor *textLightBlackColor;//999999
@property (nonatomic, strong) UIColor *navgationBarColor;//FFFFFF


@property (nonatomic, strong) UIFont *navTitleFont;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *detailFont;

@end

NS_ASSUME_NONNULL_END
