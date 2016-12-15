

//
//  BoardView.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/14.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "BoardView.h"

@implementation BoardView

+ (void)showInView:(UIView *)view
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    UIImageView *fireView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0.5*width, 0.2*height, 0.5*width, 0.5*width)];
    NSMutableArray *prupleArray = [[NSMutableArray alloc] init];
    for (int i=1; i<29; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"firework_z_%d",i] ofType:@"png"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [prupleArray addObject:img];
    }
    fireView1.animationImages = prupleArray;
    fireView1.animationDuration = 3;
    fireView1.animationRepeatCount = 0;
    [view addSubview:fireView1];
    [fireView1 startAnimating];
    
    UIImageView *fireView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0.1*width, 0.3*height, 0.23*width, 0.23*width)];
    NSMutableArray *goldArray = [[NSMutableArray alloc] init];
    for (int i=1; i<31; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"firework_e_%d",i] ofType:@"png"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [goldArray addObject:img];
    }
    fireView2.animationImages = goldArray;
    fireView2.animationDuration = 4;
    fireView2.animationRepeatCount = 0;
    [view addSubview:fireView2];
    [fireView2 startAnimating];
    
    
    UIImageView *fireView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0.7*width, 0.47*height, 0.25*width, 0.25*width)];
    fireView3.animationImages = goldArray;
    fireView3.animationDuration = 2;
    fireView3.animationRepeatCount = 0;
    [view addSubview:fireView3];
    [fireView3 startAnimating];
    
    UIImageView *fireView4 = [[UIImageView alloc] initWithFrame:CGRectMake(0.33*width, 0.43*height, 0.22*width, 0.22*width)];
    fireView4.animationImages = goldArray;
    fireView4.animationDuration = 2.5;
    fireView4.animationRepeatCount = 0;
    [view addSubview:fireView4];
    [fireView4 startAnimating];
    
    UIImageView *fireView5 = [[UIImageView alloc] initWithFrame:CGRectMake(0.15*width, 0.48*height, 0.3*width, 0.3*width)];
    fireView5.animationImages = prupleArray;
    fireView5.animationDuration = 3.5;
    fireView5.animationRepeatCount = 0;
    [view addSubview:fireView5];
    [fireView5 startAnimating];
    
    UIImageView *boatView = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0.6*height, 0.5*width, 0.25*width)];
    boatView.image = [UIImage imageNamed:@"board"];
    [view addSubview:boatView];
    
    UIImageView *waterView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0.7*height, width, 0.2*height)];
    waterView.image = [UIImage imageNamed:@"water"];
    [view addSubview:waterView];
    
    UIImageView *soupView = [[UIImageView alloc] initWithFrame:CGRectMake(0.07*width, 0.16*width, 0.2*width, 0.05*height)];
    //soupView.backgroundColor = [UIColor redColor];
    NSMutableArray *soupArray = [[NSMutableArray alloc] init];
    for (int i=1; i<13; i++) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"water_f_%d",i] ofType:@"png"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [soupArray addObject:img];
    }
    soupView.animationImages = soupArray;
    soupView.animationDuration = 2.0;
    soupView.animationRepeatCount = 0;
    [boatView addSubview:soupView];
    [soupView startAnimating];
    
    [UIView animateWithDuration:5 animations:^{
        boatView.center = CGPointMake(view.center.x, boatView.center.y);
    }];
    
    [UIView beginAnimations:@"animication" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationRepeatCount:5.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    boatView.center = CGPointMake(boatView.center.x, boatView.center.y-8);
    [UIView commitAnimations];
    
    
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakself) strongself = weakself;
        [UIView animateWithDuration:5 animations:^{
            boatView.center = CGPointMake(-boatView.frame.size.width/2, boatView.center.y);
        } completion:^(BOOL finished) {
            [fireView1 removeFromSuperview];
            [fireView2 removeFromSuperview];
            [fireView3 removeFromSuperview];
            [fireView4 removeFromSuperview];
            [fireView5 removeFromSuperview];
            [boatView removeFromSuperview];
            [waterView removeFromSuperview];
            [strongself showInView:view];
        }];
    });
    
}
@end
