//
//  CustomActionTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/9.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CustomActionTestVC.h"

@interface CustomActionTestVC ()

@property (strong, nonatomic) UIView *layerView;
@property (strong, nonatomic) CALayer *colorLayer;
@property (strong, nonatomic) UIButton *btn;

@end

@implementation CustomActionTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.layerView];
    [self.layerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor": transition};
    
    [self.layerView.layer addSublayer:self.colorLayer];
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"change" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:self.layerView parentRelation:NO distance:20 center:YES];
}

- (void)btnEvent
{
    UIColor *randomColor = [BearConstants randomColor];
    self.colorLayer.backgroundColor = randomColor.CGColor;
}

@end
