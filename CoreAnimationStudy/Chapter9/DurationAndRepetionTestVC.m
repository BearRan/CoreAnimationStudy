//
//  DurationAndRepetionTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/17.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "DurationAndRepetionTestVC.h"

@interface DurationAndRepetionTestVC () <CAAnimationDelegate>
{
    UIView *_containerView;
    UITextField *_durationTextField;
    UITextField *_repeatField;
    UIButton *_startBtn;
    CALayer *_shipLayer;
}

@end

@implementation DurationAndRepetionTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _containerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_containerView];
    [_containerView BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:nil parentRelation:YES distance:20 center:YES];
    
    _shipLayer = [CALayer layer];
    _shipLayer.frame = CGRectMake(0, 0, 100, 100);
    _shipLayer.position = CGPointMake(150, 150);
    _shipLayer.contents = (__bridge id)[UIImage imageNamed:@"rocket"].CGImage;
    [_containerView.layer addSublayer:_shipLayer];
    
    _repeatField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _repeatField.keyboardType = UIKeyboardTypeDecimalPad;
    _repeatField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_repeatField];
    
    _durationTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _durationTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _durationTextField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_durationTextField];
    
    _startBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _startBtn.backgroundColor = [UIColor orangeColor];
    [_startBtn setTitle:@"start" forState:UIControlStateNormal];
    [_startBtn addTarget:self action:@selector(startBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_startBtn];
    
    [UIView BearV2AutoLayViewArray:(NSMutableArray *)@[_repeatField, _durationTextField, _startBtn] layoutAxis:kLAYOUT_AXIS_X alignmentType:kSetAlignmentType_Start alignmentOffDis:_containerView.maxY + 30];
}

- (void)startBtnEvent
{
    NSLog(@"--startBtnEvent");
    
    CFTimeInterval duration = [_durationTextField.text doubleValue];
    float repeatCount = [_repeatField.text floatValue];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [_shipLayer addAnimation:animation forKey:@"rotateAnimation"];
}

- (void)setControlEnabled:(BOOL)enabled
{
    for (UIControl *control in @[_durationTextField, _repeatField, _startBtn]) {
        control.enabled = enabled;
        control.alpha = enabled ? 1.0 : 0.25;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self setControlEnabled:YES];
}

@end
