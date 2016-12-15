//
//  YinghuaController.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/13.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "YinghuaController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "YinhuaView.h"

@interface YinghuaController ()

@end

@implementation YinghuaController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.alpha = 0.2;
    self.automaticallyAdjustsScrollViewInsets = NO;
 
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [YinhuaView showInView:self.view];
    
}

@end
