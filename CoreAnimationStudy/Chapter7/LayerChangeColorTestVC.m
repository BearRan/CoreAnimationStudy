//
//  LayerChangeColorTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/8.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "LayerChangeColorTestVC.h"

@interface LayerChangeColorTestVC ()
{
    UIView *_contentView;
    CALayer *_colorLayer;
    UIButton *_btn;
}

@end

@implementation LayerChangeColorTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_contentView];
    [_contentView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _colorLayer = [CALayer layer];
    _colorLayer.frame = _contentView.bounds;
    _colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_contentView.layer addSublayer:_colorLayer];
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"change" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:_contentView parentRelation:NO distance:10 center:YES];
}

- (void)btnEvent
{
    UIColor *randomColor = [BearConstants randomColor];
    _colorLayer.backgroundColor = randomColor.CGColor;
}

@end
