//
//  SpaceShipTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "SpaceShipTestVC.h"

@interface SpaceShipTestVC ()

@property (strong, nonatomic) UIView *containerView;

@end

@implementation SpaceShipTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.containerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.containerView];
    [self.containerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(255, 300)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3;
    [self.containerView.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 60, 40);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"rocket"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 4.0;
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [shipLayer addAnimation:animation forKey:nil];
}

@end
