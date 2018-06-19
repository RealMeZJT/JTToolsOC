//
//  JTProgressWebView.m
//
//  Created by ZhouJiatao on 2018.06.12.
//  Copyright © 2018 dcn. All rights reserved.
//

#import "JTProgressWebView.h"
@interface JTProgressWebView()
@property (strong, nonatomic) IBOutlet UIProgressView *vProgress;
@end

@implementation JTProgressWebView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self  = [super initWithCoder:coder]){
        [self setup];
    }
    return self;
}

- (void) setup {
    self.vProgress = [[UIProgressView alloc] init];
    self.vProgress.progress = 0.0;
    [self addSubview:self.vProgress];
    [self.vProgress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(4);
    }];
    
        [self addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"estimatedProgress"]) {
        self.vProgress.progress = self.estimatedProgress;
        if (self.estimatedProgress == 1.0) {
            self.vProgress.hidden = YES;
        }
    }
}

@end
