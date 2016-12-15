//
//  ShengdanController.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/13.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "ShengdanController.h"
#import "DanView.h"

@interface ShengdanController ()

@end

@implementation ShengdanController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];

    [DanView showInView:self.view];
    
}


@end
