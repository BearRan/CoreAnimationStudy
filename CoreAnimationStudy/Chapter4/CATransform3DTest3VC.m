//
//  CATransform3DTest3VC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/21.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CATransform3DTest3VC.h"

@interface CATransform3DTest3VC ()
{
    UIView *_testView1;
    UIView *_testView2;
}

@end

@implementation CATransform3DTest3VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat viewWidth = 150;
    
    _testView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
    _testView1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_testView1];
    
    _testView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
    _testView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_testView2];
    
    [UIView BearAutoLayViewArray:(NSMutableArray *)@[_testView1, _testView2] layoutAxis:kLAYOUT_AXIS_X center:YES];
    
    [self createTest1];
    [self createTest2];
}

- (void)createTest1
{
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    subView.backgroundColor = [UIColor whiteColor];
    [_testView1 addSubview:subView];
    [subView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    _testView1.layer.transform = outer;
    
    CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
    subView.layer.transform = inner;
}

- (void)createTest2
{
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    subView.backgroundColor = [UIColor whiteColor];
    [_testView2 addSubview:subView];
    [subView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = - 1.0 / 500;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    _testView2.layer.transform = outer;
    
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = - 1.0 / 500;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    subView.layer.transform = inner;
}

@end
