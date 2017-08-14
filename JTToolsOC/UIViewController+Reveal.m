//
//  UIViewController+Reveal.m
//  Atlas
//
//  Created by TabZhou on 07/06/2017.
//  Copyright © 2017 DCN. All rights reserved.
//

#import "UIViewController+Reveal.h"

@implementation UIViewController (Reveal)

+ (UIViewController *)topViewController {
    UIViewController *rootController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController topViewController:rootController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController {
    
    if ([rootViewController presentedViewController] != nil) {
        UIViewController *presentedVC = [rootViewController presentedViewController];
        return [UIViewController topViewController: presentedVC];
    }
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        UIViewController *lastPushController = [[navigationController viewControllers] lastObject];
        return [UIViewController topViewController: lastPushController];
    }
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        UIViewController *selectedController = [tabBarController selectedViewController];
        return [UIViewController topViewController:selectedController];
    }
    
    UIViewController *child = rootViewController.childViewControllers.lastObject;
    if (child != nil) {
        return [UIViewController topViewController:child];
    }
    
    return rootViewController;

}
@end
