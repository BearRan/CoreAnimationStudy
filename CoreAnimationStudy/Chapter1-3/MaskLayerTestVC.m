//
//  MaskLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "MaskLayerTestVC.h"

@interface MaskLayerTestVC ()
{
    UIImageView *imageView, *referenceImageView;
    CALayer *maskLayer, *referenceMasklayer;
    UIImage *haveAlphaImage, *testImage;
    UIView *referenceMaskLayerContentView;
}
@end

@implementation MaskLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    [self createReferenceImageView];
    [self createReferenceMaskLayer];
}

- (void)createUI
{
    haveAlphaImage = [UIImage imageNamed:@"image3_halfAlpha"];
    testImage = [UIImage imageNamed:@"image2"];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.image = testImage;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imageView];
    [imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    maskLayer = [CALayer layer];
    maskLayer.frame = imageView.bounds;
    maskLayer.contents = (__bridge id)haveAlphaImage.CGImage;
    imageView.layer.mask = maskLayer;
}

- (void)createReferenceImageView
{
    referenceImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, NAV_STA, 150, 150)];
    referenceImageView.image = testImage;
    referenceImageView.contentMode = UIViewContentModeScaleAspectFill;
    referenceImageView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:referenceImageView];
}

- (void)createReferenceMaskLayer
{
    referenceMaskLayerContentView = [[UIView alloc] initWithFrame:CGRectMake(referenceImageView.maxX + 50, NAV_STA, 150, 150)];
    referenceMaskLayerContentView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:referenceMaskLayerContentView];
    
    referenceMasklayer = [CALayer layer];
    referenceMasklayer.frame = imageView.bounds;
    referenceMasklayer.contents = (__bridge id)haveAlphaImage.CGImage;
    referenceMasklayer.contentsGravity = kCAGravityCenter;
    referenceMasklayer.contentsScale = 1.5;
    [referenceMaskLayerContentView.layer addSublayer:referenceMasklayer];
}

@end
