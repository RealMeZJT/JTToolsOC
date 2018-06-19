//
//  UIAlertController+Quick.h
//    
//  快速创建、显示 UIAlertController的工具类
//  Created by ZhouJiatao on 2018.06.08.
//  Copyright © 2018 dcn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Quick)
+ (void) showAlertWithTitle: (NSString *) title  messsage:(NSString*)message
                   yesTitle:(NSString *)yesTitle  yesStyle: (UIAlertActionStyle)yesStyle yesHandler:(void (^ __nullable)(UIAlertAction *action))yesHandler cancleTitle:(NSString *)cancleTitle;

+ (UIAlertController *) quick_alertWithTitle: (NSString*) title messsage:(NSString*)message
                                    yesTitle:(NSString *)yesTitle  yesStyle: (UIAlertActionStyle)yesStyle yesHandler:(void (^ __nullable)(UIAlertAction *action))yesHandler cancleTitle:(NSString *)cancleTitle  cacleStyle: (UIAlertActionStyle)cancleStyle cacleHandler:(void (^ __nullable)(UIAlertAction *action))cancleHandler;
@end
