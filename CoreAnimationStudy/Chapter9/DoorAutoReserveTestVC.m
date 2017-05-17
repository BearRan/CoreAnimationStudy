//
//  DoorAutoReserveTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/17.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "DoorAutoReserveTestVC.h"

@interface DoorAutoReserveTestVC ()

@end

@implementation DoorAutoReserveTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    CALayer *doorLayer = [CALayer layer];
    doorLayer.frame = CGRectMake(0, 0, 128, 256);
    doorLayer.position = CGPointMake(WIDTH / 2.0, HEIGHT / 2.0);
    doorLayer.anchorPoint = CGPointMake(0, 0.5);
    doorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:doorLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500;
    self.view.layer.sublayerTransform = perspective;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [doorLayer addAnimation:animation forKey:nil];
}

@end
