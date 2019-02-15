//
//  SimpleThemeColor.h
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Theme.h"
NS_ASSUME_NONNULL_BEGIN

@interface SimpleThemeColor : NSObject
+ (instancetype)sharaInstance;
@property (strong, nonatomic) Theme *theme;
@end

NS_ASSUME_NONNULL_END
