//
//  RightImageButton.m
//    
//
//  Created by ZhouJiatao on 2018.06.09.
//  Copyright © 2018 dcn. All rights reserved.
//

#import "RightImageButton.h"

@implementation RightImageButton


- (void) update {
    
    CGFloat space = 0;

    CGRect r = self.titleLabel.frame;
    r.origin.x = 0;
    self.titleLabel.frame = r;
    
    CGRect r2 = self.imageView.frame;
    r2.origin.x = self.titleLabel.frame.size.width + space;
    self.imageView.frame = r2;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self update];
}



@end
