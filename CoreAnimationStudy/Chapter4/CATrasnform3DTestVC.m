//
//  CATrasnform3DTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CATrasnform3DTestVC.h"

@interface CATrasnform3DTestVC ()
{
    UIImageView *_imageView;
    UIImageView *_imageBackTestView;
}

@end

@implementation CATrasnform3DTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTestImageV];
//    [self test3DRotation];
    [self test3DRotationWith_m34];
    [self testRotationBack];
}

- (void)createTestImageV
{
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    _imageView.frame = CGRectMake(0, 0, 150, 150);
    [self.view addSubview:_imageView];
    
    _imageBackTestView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    _imageBackTestView.frame = CGRectMake(0, 0, 150, 150);
    [self.view addSubview:_imageBackTestView];
    
    [UIView BearAutoLayViewArray:(NSMutableArray *)@[_imageView, _imageBackTestView] layoutAxis:kLAYOUT_AXIS_X center:YES gapDistance:50];
}

- (void)test3DRotation
{
    CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    _imageView.layer.transform = transform;
}

- (void)test3DRotationWith_m34
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    _imageView.layer.transform = transform;
}

- (void)testRotationBack
{
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    _imageBackTestView.layer.transform = transform;
    
    _imageBackTestView.layer.doubleSided = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
