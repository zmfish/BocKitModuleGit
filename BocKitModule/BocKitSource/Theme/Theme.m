//
//  Theme.m
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import "Theme.h"

@implementation Theme

@synthesize textRedColor = _textRedColor;
@synthesize textLightRedColor = _textLightRedColor;
@synthesize navgationBarColor = _navgationBarColor;

@synthesize textBlackColor = _textBlackColor;
@synthesize textLightBlackColor = _textLightBlackColor;
@synthesize textTitleColor = _textTitleColor;


@synthesize navTitleFont = _navTitleFont;
@synthesize titleFont =  _titleFont;
@synthesize detailFont = _detailFont;

- (void)setTextRedColor:(UIColor *)textRedColor{
    _textRedColor = textRedColor;
}

- (UIColor *)textRedColor{
    return _textRedColor;
}

- (void)setTextLightRedColor:(UIColor *)textLightRedColor{
    _textLightRedColor = textLightRedColor;
}

- (UIColor *)textLightRedColor{
    return _textLightRedColor;
}

- (void)setNavgationBarColor:(UIColor *)navgationBarColor{
    _navgationBarColor = navgationBarColor;
}
- (UIColor *)navgationBarColor{
    return _navgationBarColor;
}

- (void)setTextBlackColor:(UIColor *)textBlackColor{
    _textBlackColor = textBlackColor;
}

- (UIColor *)textBlackColor{
    return _textBlackColor;
}


- (void)setTextLightBlackColor:(UIColor *)textLightBlackColor{
    _textLightBlackColor = textLightBlackColor;
}

- (UIColor *)textLightBlackColor{
    return _textLightBlackColor;
}

- (void)setTextTitleColor:(UIColor *)textTitleColor{
    _textTitleColor = textTitleColor;
}

- (UIColor *)textTitleColor{
    return _textTitleColor;
}


- (void)setNavTitleFont:(UIFont *)navTitleFont{
    _navTitleFont = navTitleFont;
}

- (UIFont *)navTitleFont{
    return _navTitleFont;
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
}

- (UIFont *)titleFont{
    return _titleFont;
}

- (void)setDetailFont:(UIFont *)detailFont{
    _detailFont = detailFont;
}

- (UIFont *)detailFont{
    return _detailFont;
}


@end
