//
//  LollipopController.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/15.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "LollipopController.h"
#import "LollipopView.h"

@interface LollipopController ()

@end

@implementation LollipopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
 
    //[LollipopView showInView:self.view withCount:66];
    [LollipopView showInView:self.view withCount:250];
}

@end
