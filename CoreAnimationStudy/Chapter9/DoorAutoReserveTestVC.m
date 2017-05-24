//
//  DoorAutoReserveTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/17.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "DoorAutoReserveTestVC.h"

@interface DoorAutoReserveTestVC ()
{
    CALayer *_doorLayer;
}

@end

@implementation DoorAutoReserveTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _doorLayer = [CALayer layer];
    _doorLayer.frame = CGRectMake(0, 0, 128, 256);
    _doorLayer.position = CGPointMake(WIDTH / 2.0, HEIGHT / 2.0);
    _doorLayer.anchorPoint = CGPointMake(0, 0.5);
    _doorLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_doorLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0/500;
    self.view.layer.sublayerTransform = perspective;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 2.0;
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [_doorLayer addAnimation:animation forKey:nil];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGFloat x = [pan translationInView:self.view].x;
    CFTimeInterval timeOffSet = _doorLayer.timeOffset;
    timeOffSet = MIN(0.999, MAX(0.0, timeOffSet - x));
    _doorLayer.timeOffset = timeOffSet;
    [pan setTranslation:CGPointZero inView:self.view];
}

@end
