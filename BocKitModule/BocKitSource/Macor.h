
//
//  Macor.h
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#ifndef Macor_h
#define Macor_h

//  Screen
#define kScreenBounds UIScreen.mainScreen.bounds
#define kScreenSize UIScreen.mainScreen.bounds.size
#define kScreenWidth kScreenSize.width
#define kScreenHeight kScreenSize.height
#define kScreenCenter CGPointMake(SLScreenWidth/2.0, SLScreenHeight/2.0)

#define kStatusBarHeight (UIApplication.sharedApplication.statusBarFrame.size.height)
#define kNavBarHeight (44.0)
#define kNavigationBarHeight (kStatusBarHeight + kNavBarHeight)
#define kTabBarHeight (kStatusBarHeight > 20 ? 83:49)
#define kBottomHeight (kStatusBarHeight > 20 ? 43:0)

//  Color
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBColor(r, g, b) RGBAColor(r, g, b, 1.0)

#define HexAColor(hex, a) [UIColor colorWithRed:((0x##hex&0xFF0000)>>16)/255.0 green:((0x##hex&0xFF00)>>8)/255.0 blue:(0x##hex&0xFF)/255.0 alpha:(a)]
#define HexColor(hex) HexAColor(hex, 1.0)

#endif /* Macor_h */
