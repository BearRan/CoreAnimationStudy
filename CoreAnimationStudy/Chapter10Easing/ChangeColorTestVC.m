//
//  ChangeColorTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/24.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ChangeColorTestVC.h"

@interface ChangeColorTestVC ()
{
    CALayer *_colorLayer;
    UIView *_layerView;
}

@end

@implementation ChangeColorTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_layerView];
    [_layerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _colorLayer = [CALayer layer];
    _colorLayer.frame = _layerView.bounds;
    _colorLayer.backgroundColor = [BearConstants randomColor].CGColor;
    [_layerView.layer addSublayer:_colorLayer];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(changeColorEvent) forControlEvents:UIControlEventTouchUpInside];
    [btn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:_layerView parentRelation:NO distance:50 center:YES];
}

- (void)changeColorEvent
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 6.0;
    animation.values = @[
                         (__bridge id)[BearConstants randomColor].CGColor,
                         (__bridge id)[BearConstants randomColor].CGColor,
                         (__bridge id)[BearConstants randomColor].CGColor,
                         (__bridge id)[BearConstants randomColor].CGColor,
                         ];
    
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.timingFunctions = @[fn, fn, fn];
    
    [_colorLayer addAnimation:animation forKey:nil];
    
//    _colorLayer.geometryFlipped
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
}

@end
