//
//  SimpleThemeColor.m
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import "SimpleThemeColor.h"
#import "Macor.h"
static SimpleThemeColor *themeColor = nil;
@implementation SimpleThemeColor

+ (instancetype)sharaInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (themeColor) {
            themeColor = [[SimpleThemeColor alloc]init];
            [themeColor configColor];
        }
    });
    return themeColor;
}

- (void)configColor{
    _theme = [[Theme alloc]init];
    _theme.textTitleColor = HexColor(000000);
    _theme.textBlackColor = HexColor(333333);
    _theme.textRedColor = HexColor(E12219);
    _theme.textLightRedColor = HexColor(E93427);
    _theme.textLightBlackColor = HexColor(999999);
    _theme.navgationBarColor = HexColor(FFFFFF);
    _theme.navTitleFont = [UIFont boldSystemFontOfSize:17];
    _theme.titleFont = [UIFont systemFontOfSize:14];
    _theme.detailFont = [UIFont systemFontOfSize:12];
}

@end
