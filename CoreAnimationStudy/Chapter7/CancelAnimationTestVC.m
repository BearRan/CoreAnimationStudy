//
//  CancelAnimationTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/16.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CancelAnimationTestVC.h"

static NSString *animationKey = @"rotateAnimation";

@interface CancelAnimationTestVC () <CAAnimationDelegate>
{
    UIView *_containerView;
    CALayer *_shipLayer;
}

@end

@implementation CancelAnimationTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _containerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_containerView];
    [_containerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _shipLayer = [CALayer layer];
    _shipLayer.frame = CGRectMake(0, 0, 100, 100);
    _shipLayer.position = CGPointMake(100, 100);
    _shipLayer.contents = (__bridge id)[UIImage imageNamed:@"rocket"].CGImage;
    [_containerView.layer addSublayer:_shipLayer];
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    startBtn.backgroundColor = [UIColor blueColor];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    stopBtn.backgroundColor = [UIColor blueColor];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stopBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    [UIView BearV2AutoLayViewArray:(NSMutableArray *)@[startBtn, stopBtn] layoutAxis:kLAYOUT_AXIS_X alignmentType:kSetAlignmentType_Start alignmentOffDis:_containerView.maxY + 20];
}

- (void)startBtnEvent
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [_shipLayer addAnimation:animation forKey:animationKey];
}

- (void)stopBtnEvent
{
    [_shipLayer removeAnimationForKey:animationKey];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"The animation stopped (finished: %@)", flag ? @"YES": @"NO");
}

@end
