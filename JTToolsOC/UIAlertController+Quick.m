//
//  UIAlertController+Quick.m
//
//
//  Created by ZhouJiatao on 2018.06.08.
//  Copyright © 2018 dcn. All rights reserved.
//

#import "UIAlertController+Quick.h"
#import "UIViewController+Reveal.h"

@implementation UIAlertController (Quick)


+ (void) showAlertWithTitle: (NSString *) title  messsage:(NSString*)message
                   yesTitle:(NSString *)yesTitle  yesStyle: (UIAlertActionStyle)yesStyle yesHandler:(void (^ __nullable)(UIAlertAction *action))yesHandler cancleTitle:(NSString *)cancleTitle {
    UIAlertController *alert = [UIAlertController quick_alertWithTitle:title messsage:message yesTitle:yesTitle yesStyle:yesStyle yesHandler:yesHandler cancleTitle:cancleTitle cacleStyle:(UIAlertActionStyleDefault) cacleHandler:nil];
    [[UIViewController topViewController] presentViewController:alert animated:YES completion:nil];
}

+ (UIAlertController *) quick_alertWithTitle: (NSString*) title messsage:(NSString*)message
                   yesTitle:(NSString *)yesTitle  yesStyle: (UIAlertActionStyle)yesStyle yesHandler:(void (^ __nullable)(UIAlertAction *action))yesHandler cancleTitle:(NSString *)cancleTitle  cacleStyle: (UIAlertActionStyle)cancleStyle cacleHandler:(void (^ __nullable)(UIAlertAction *action))cancleHandler{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancleTitle != nil) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:cancleTitle style:cancleStyle handler:cancleHandler];
        [alert addAction:action2];
    }
    
    if (yesTitle != nil) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:yesTitle style:yesStyle handler:yesHandler];
        [alert addAction:action1];
    }
    
    return alert;
}
@end
