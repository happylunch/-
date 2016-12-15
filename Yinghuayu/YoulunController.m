

//
//  YoulunController.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/14.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "YoulunController.h"
#import "BoardView.h"

@interface YoulunController ()

@end

@implementation YoulunController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [BoardView showInView:self.view];
    
}

@end
