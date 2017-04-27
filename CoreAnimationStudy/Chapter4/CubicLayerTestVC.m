//
//  CubicLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/27.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CubicLayerTestVC.h"
#import <UIView+BearSet.h>
#import <BearDefines.h>

@interface CubicLayerTestVC ()
{
    CGFloat _halfWidth;
    UIView *_contentView;
}

@end

@implementation CubicLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _halfWidth = 50;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    _contentView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_contentView];
    [_contentView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = - 1.0 / 500;
    _contentView.layer.sublayerTransform = pt;
    
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cubel = [self cubeWithTransform:c1t];
    [_contentView.layer addSublayer:cubel];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [_contentView.layer addSublayer:cube2];
    
}

- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-_halfWidth, -_halfWidth, 2 * _halfWidth, 2 * _halfWidth);
    face.backgroundColor = [BearConstants randomColor].CGColor;
    face.transform = transform;
    
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];
    
    //  1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, _halfWidth);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //  2
    ct = CATransform3DMakeTranslation(_halfWidth, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //  3
    ct = CATransform3DMakeTranslation(0, -_halfWidth, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //  4
    ct = CATransform3DMakeTranslation(_halfWidth, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //  5
    ct = CATransform3DMakeTranslation(0, _halfWidth, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //  6
    ct = CATransform3DMakeTranslation(0, 0, -_halfWidth);
    ct = CATransform3DRotate(ct, M_PI, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    cube.transform = transform;
    return cube;
}

@end
