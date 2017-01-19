//
//  CAAffineTransformVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CAAffineTransformVC.h"

@interface CAAffineTransformVC ()
{
    UIView *_testView;
}
@end

@implementation CAAffineTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAAffineTransformVC";
    [self createUI];
    [self tranform];
}

- (void)createUI
{
    UIImage *testImage = [UIImage imageNamed:@"image2"];
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _testView.layer.contents = (__bridge id)testImage.CGImage;
    _testView.layer.contentsGravity = kCAGravityResizeAspect;
    _testView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:_testView];
    [_testView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)tranform
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    _testView.layer.affineTransform = transform;
}

@end
