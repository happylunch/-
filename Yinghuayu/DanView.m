//
//  DanView.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/14.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "DanView.h"

@implementation DanView

+ (void)showInView:(UIView *)view;
{
    
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(mScreenWidth/2, 0.2*mScreenHeight);
    snowEmitter.emitterSize = CGSizeMake(mScreenWidth, 0.1*mScreenHeight);//发射源的尺寸大小
    snowEmitter.emitterShape = kCAEmitterLayerSphere;//发射源的形状
    snowEmitter.emitterMode = kCAEmitterLayerSurface;//发射模式
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.name = @"snow";
    snowflake.birthRate = 1;//每秒生成多少个粒子
    snowflake.lifetime = 10;//粒子存活的时间,以秒为单位
    snowflake.lifetimeRange = 8;// 可以为这个粒子存活的时间再指定一个范围。
    snowflake.velocity = 10;//粒子平均初始速度。
    snowflake.velocityRange = 7;//可以再指定一个范围。
    snowflake.yAcceleration = 10;//y方向加速度
    snowflake.emissionRange = 0.5*M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
    snowflake.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dan_snow"].CGImage);
    //snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];//设置雪花形状的粒子的颜色
    snowflake.scale = 0.5;
    snowflake.spin =0.3*M_PI; //粒子的平均旋转速度
    snowflake.spinRange = 0.25*M_PI;//可指定一个范围。弧度制。
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    //通过调用keypath属性控制开始
    //[snowEmitter setValue:@500 forKeyPath:@"emitterCells.snow.birthRate"];
    //结束
    //[snowEmitter setValue:@0 forKeyPath:@"emitterCells.snow.birthRate"];
    
    snowEmitter.shadowOpacity = 1.0;//阴影透明度
    snowEmitter.shadowRadius = 0;//阴影半径
    snowEmitter.shadowOffset = CGSizeMake(0, 1);//阴影偏移量
    //snowEmitter.shadowColor = [[UIColor redColor] CGColor];//阴影颜色
    
    [view.layer insertSublayer:snowEmitter atIndex:0];
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    //snowEmitter.shadowColor = [[UIColor redColor] CGColor];
    
    [view.layer addSublayer:snowEmitter];
    
    UIImageView *trunkImgv = [[UIImageView alloc] initWithFrame:CGRectMake(mScreenWidth, 0.6*mScreenHeight, 0.5*mScreenWidth, 0.5/2.1*mScreenWidth)];
    trunkImgv.image = [UIImage imageNamed:@"dan_trunk"];
    trunkImgv.alpha = 0;
    [view addSubview:trunkImgv];
    
    [UIView animateWithDuration:0.5 delay:0.25 options:UIViewAnimationOptionCurveEaseOut animations:^{
        trunkImgv.center = CGPointMake(view.center.x, trunkImgv.center.y);
        trunkImgv.alpha = 1;
    } completion:nil];

    
    __weak typeof(self) weakself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakself) strongself = weakself;

        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            trunkImgv.center = CGPointMake(-trunkImgv.frame.size.width/2, trunkImgv.center.y);
            trunkImgv.alpha = 0;
        } completion:^(BOOL finished) {
            [trunkImgv removeFromSuperview];
            [snowEmitter removeFromSuperlayer];
            [strongself showInView:view];
        }];
    });
}

@end
