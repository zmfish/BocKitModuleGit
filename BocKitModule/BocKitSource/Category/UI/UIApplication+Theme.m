//
//  UIApplication+Theme.m
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import "UIApplication+Theme.h"
#import <objc/runtime.h>

@implementation UIApplication (Theme)
static void *themeKey = &themeKey;
- (void)setTheme:(Theme *)theme{
    objc_setAssociatedObject(self, themeKey, theme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Theme *)theme{
    return objc_getAssociatedObject(self, themeKey);
}

@end
