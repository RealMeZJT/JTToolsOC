//
//  UIButton+Block.h
//  Atlas
//  此代码来源于：https://cnbin.github.io/blog/2016/03/16/uibutton-plus-blockde-shi-yong/
//  Created by TabZhou on 28/07/2017.
//  Copyright © 2017 DCN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton(Block)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
