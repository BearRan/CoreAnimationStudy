//
//  LayerBehaviorTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/9.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "LayerBehaviorTestVC.h"

@interface LayerBehaviorTestVC ()

@property (strong, nonatomic) UIView *layerView;
@property (strong, nonatomic) UIButton *btn;

@end

@implementation LayerBehaviorTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.layerView];
    UIColor *randomColor = [BearConstants randomColor];
    self.layerView.layer.backgroundColor = randomColor.CGColor;
    [self.layerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"change" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:self.layerView parentRelation:NO distance:20 center:YES];
}

- (void)test1
{
    NSLog(@"OutSide:%@", [self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    
    [UIView beginAnimations:nil context:nil];
    
    NSLog(@"IutSide:%@", [self.layerView actionForLayer:self.layerView.layer forKey:@"backgroundColor"]);
    
    [UIView commitAnimations];
}

- (void)layerViewTrasactionTest
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    
    UIColor *randomColor = [BearConstants randomColor];
    self.layerView.layer.backgroundColor = randomColor.CGColor;
    
    [CATransaction commit];
}


- (void)btnEvent
{
//    [self layerViewTrasactionTest];
    
    [self test1];
}

@end
