//
//  FlowStateLabel.m
//    
//
//  Created by ZhouJiatao on 2018.06.11.
//  Copyright © 2018 dcn. All rights reserved.
//

#import "InsetsLabel.h"

@implementation InsetsLabel

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
