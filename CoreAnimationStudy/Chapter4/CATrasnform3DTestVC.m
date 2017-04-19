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
}

@end

@implementation CATrasnform3DTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTestImageV];
//    [self test3DRotation];
    [self test3DRotationWith_m34];
}

- (void)createTestImageV
{
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    _imageView.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:_imageView];
    [_imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
