//
//  ViewController.m
//  JTToolsOC
//
//  Created by TabZhou on 14/08/2017.
//  Copyright © 2017 ZJT. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Reveal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Top ViewController: %@", [UIViewController topViewController]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
