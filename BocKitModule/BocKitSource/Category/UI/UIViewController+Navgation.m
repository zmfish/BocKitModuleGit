//
//  UIViewController+Navgation.m
//  BocKitModule
//
//  Created by 张扬明 on 2019/1/30.
//  Copyright © 2019 张扬明. All rights reserved.
//

#import "UIViewController+Navgation.h"
#import <objc/runtime.h>
#import "BocKit.h"
static void *customNavgationBarViewKey = &customNavgationBarViewKey;

@implementation UIViewController (NavgationBar)
- (void)setCustomNavgationBarView:(UIView <BocNavgationBarProtocol>*)customNavgationBarView{
    objc_setAssociatedObject(self, customNavgationBarViewKey, customNavgationBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView <BocNavgationBarProtocol>*)customNavgationBarView{
    return objc_getAssociatedObject(self, customNavgationBarViewKey);
}

- (void)configerCustomerNavgationNar{
    __block UIView *navgationBar= nil;
    [[self.view subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj conformsToProtocol:@protocol(BocNavgationBarProtocol)]) {
            navgationBar = obj;
        }
    }];
    if (navgationBar) {
        [navgationBar setFrame:CGRectMake(0, 0,kScreenWidth, kNavigationBarHeight)];
    }
}
@end

@implementation UINavigationController (Navgation)

- (void)configerNavgationBar{
    UIApplication *application = [UIApplication sharedApplication];
    UINavigationBar.appearance.barTintColor = application.theme.navgationBarColor;
    UINavigationBar.appearance.translucent = NO;
    UINavigationBar.appearance.shadowImage = [UIImage new];
    [UINavigationBar.appearance setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName : UIColor.whiteColor,
                                                       NSFontAttributeName :application.theme.navTitleFont};
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0;
    NSLog(@"%d",viewController.hidesBottomBarWhenPushed);
    if (!viewController.navigationItem.leftBarButtonItem && self.viewControllers.count) {
        
        UIImage *image = [[UIImage imageNamed:@"Resources.bundle/smileKits_leftArrow" inBundle:[NSBundle bundleForClass:NSClassFromString(@"RootNavigationController")] compatibleWithTraitCollection:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(actionWithBackButtonItem)];
    }
    
    [self pushViewController:viewController animated:animated];
    
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = UIScreen.mainScreen.bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}
#pragma clang diagnostic pop


- (void)actionWithBackButtonItem
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

@end


@implementation UIViewController (DeadLine)
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

+ (void)viewDidLoad:(UIViewController *)viewController withPosition:(AspectOptions)options{
    if (options == AspectPositionAfter) {
        if (viewController.navigationController.navigationBar.hidden) {
            [viewController configerCustomerNavgationNar];
            [viewController.view bringSubviewToFront:viewController.customNavgationBarView];
        }else {
            [viewController.navigationController configerNavgationBar];
        }
    }
    NSLog(@"[%@ viewDidLoad]", [viewController class]);
}

+ (void)viewWillAppear:(UIViewController *)viewController withPosition:(AspectOptions)options{
    NSLog(@"[%@ viewWillAppear]",[viewController class]);
}

+ (void)viewWillDisappear:(UIViewController *)viewController withPosition:(AspectOptions)options{
    NSLog(@"[%@ viewWillDisappear]",[viewController class]);
}

@end



