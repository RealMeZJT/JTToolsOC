//
//  UIViewController+Reveal.h
//  Atlas
//
//  Created by TabZhou on 07/06/2017.
//  Copyright © 2017 DCN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Reveal)
+ (UIViewController*) topViewController;
+ (UIViewController*) topViewController:(UIViewController *) rootViewController;
@end
