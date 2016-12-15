
//
//  LollipopView.m
//  Yinghuayu
//
//  Created by zt-2009958 on 16/12/15.
//  Copyright © 2016年 happy. All rights reserved.
//

#import "LollipopView.h"

@implementation LollipopView

+ (void)showInView:(UIView *)view withCount:(int)count
{
    
    if (count>=198) {
        CAEmitterLayer *lollipop = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/4, mScreenHeight/3*2) count:count/3];
        [view.layer addSublayer:lollipop];
        CAEmitterLayer *loll = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/4*3, mScreenHeight/3*2) count:count/3];
        [view.layer addSublayer:loll];
        CAEmitterLayer *lol = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/2, mScreenHeight/3) count:count/3];
        [view.layer addSublayer:lol];
    }else if (count >=132){
        CAEmitterLayer *lollipop = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/4, mScreenHeight/2) count:count/2];
        [view.layer addSublayer:lollipop];
        CAEmitterLayer *loll = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/4*3, mScreenHeight/2) count:count/2];
        [view.layer addSublayer:loll];
    }else if (count>=66){
        CAEmitterLayer *lollipop = [self createCAEmitterLayerWithPosition:CGPointMake(mScreenWidth/2, mScreenHeight/2) count:66];
        [view.layer addSublayer:lollipop];
    }else
    {
    
    }
}

+ (CAEmitterLayer *)createCAEmitterLayerWithPosition:(CGPoint)position count:(int)count
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = position;
    snowEmitter.emitterSize = CGSizeMake(0, 0);//发射源的尺寸大小
    snowEmitter.emitterShape = kCAEmitterLayerPoint;//发射源的形状
    snowEmitter.emitterMode = kCAEmitterLayerPoints;//发射模式
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.name = @"bangbang";
    snowflake.birthRate = (count+1)/3>22?22:(count+1)/3;//每秒生成多少个粒子
    snowflake.lifetime = 3;//粒子存活的时间,以秒为单位
    snowflake.lifetimeRange = 3;// 可以为这个粒子存活的时间再指定一个范围。
    snowflake.velocity = 30;
    snowflake.velocityRange = 2;
    
    snowflake.emissionRange = M_PI;//以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内。
    snowflake.contents = (__bridge id _Nullable)([UIImage imageNamed:@"bangbang"].CGImage);
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
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    //snowEmitter.shadowColor = [[UIColor redColor] CGColor];
    
    return snowEmitter;
}


@end
