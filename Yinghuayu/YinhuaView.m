



//
//  YinhuaView.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/15.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "YinhuaView.h"

@implementation YinhuaView

+ (void)showInView:(UIView *)view
{
    UIImageView *sakuraView = [[UIImageView alloc] initWithFrame:CGRectMake(0.2*mScreenWidth, 64, 0.8*mScreenWidth, 0.52*mScreenWidth)];
    sakuraView.image = [UIImage imageNamed:@"sakura"];
    [view addSubview:sakuraView];
    
    
    NSArray *imgNames = @[@"sakura_petal1",@"sakura_petal2",@"sakura_petal3"];
    for (int i=0; i<3; i++) {
        CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
        snowEmitter.emitterPosition = CGPointMake(mScreenWidth*0.6, 0.3*mScreenHeight*(1.2+(double)(rand()/(double)RAND_MAX)));
        snowEmitter.emitterSize = CGSizeMake(mScreenWidth, 0);//发射源的尺寸大小
        snowEmitter.emitterShape = kCAEmitterLayerSphere;//发射源的形状
        snowEmitter.emitterMode = kCAEmitterLayerSurface;//发射模式
        CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
        snowflake.name = imgNames[i];
        snowflake.birthRate = 2;//每秒生成多少个粒子
        snowflake.lifetime = 10;//粒子存活的时间,以秒为单位
        snowflake.lifetimeRange = 3;// 可以为这个粒子存活的时间再指定一个范围。
        snowflake.velocity = 10;//粒子平均初始速度。
        snowflake.velocityRange = 7;//可以再指定一个范围。
        snowflake.yAcceleration = 10;//y方向加速度
        snowflake.emissionRange = 0.5*M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
        snowflake.contents = (__bridge id _Nullable)([UIImage imageNamed:imgNames[i]].CGImage);
        //snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];//设置雪花形状的粒子的颜色
        snowflake.scale = 0.3;
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
    }
    NSArray *imgTitles = @[@"sakura_flower1",@"sakura_flower2"];
    for (int i=0; i<2; i++) {
        CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
        snowEmitter.emitterPosition = CGPointMake(mScreenWidth*0.7*(i+1)/2, 0.2*mScreenHeight);
        snowEmitter.emitterSize = CGSizeMake(mScreenWidth, 0.1*mScreenWidth);//发射源的尺寸大小
        snowEmitter.emitterShape = kCAEmitterLayerRectangle;//发射源的形状
        snowEmitter.emitterMode = kCAEmitterLayerOutline;//发射模式
        CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
        snowflake.name = imgTitles[i];
        snowflake.birthRate = 1;//每秒生成多少个粒子
        snowflake.lifetime = 3;//粒子存活的时间,以秒为单位
        snowflake.lifetimeRange = 2;// 可以为这个粒子存活的时间再指定一个范围。
//        snowflake.velocity = 0;//粒子平均初始速度。
//        snowflake.velocityRange = 7;//可以再指定一个范围。
//        snowflake.yAcceleration = 0;//y方向加速度
//        snowflake.emissionRange = 0.5*M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
        snowflake.contents = (__bridge id _Nullable)([UIImage imageNamed:imgTitles[i]].CGImage);
        //snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];//设置雪花形状的粒子的颜色
        snowflake.scale = 0.5*(double)(rand()/(double)RAND_MAX);
        snowflake.spin =0.3*M_PI; //粒子的平均旋转速度
        snowflake.spinRange = 0.5*M_PI;//可指定一个范围。弧度制。
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
    }
    
    
    
}

@end
