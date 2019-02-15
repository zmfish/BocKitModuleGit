//
//  UIViewController+Navgation.h
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BocNavgationBarProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavgationBar)
- (void)setCustomNavgationBarView:(UIView <BocNavgationBarProtocol>*)customNavgationBarView;
- (UIView <BocNavgationBarProtocol>*)customNavgationBarView;
@end

@interface UINavigationController (Navgation)

@end


@interface UIViewController (DeadLine)

@end




NS_ASSUME_NONNULL_END
