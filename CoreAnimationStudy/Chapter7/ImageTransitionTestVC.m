//
//  ImageTransitionTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ImageTransitionTestVC.h"

@interface ImageTransitionTestVC ()
{
    UIImageView *_imageView;
    NSArray *_images;
}

@end

@implementation ImageTransitionTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    _images = @[[UIImage imageNamed:@"7_C"],
                [UIImage imageNamed:@"11_Lemon"],
                [UIImage imageNamed:@"12_LexTang"],
                [UIImage imageNamed:@"image2"],
                ];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _imageView.image = _images[0];
    [self.view addSubview:_imageView];
    [_imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIButton *switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    switchBtn.backgroundColor = [UIColor orangeColor];
    [switchBtn setTitle:@"switch" forState:UIControlStateNormal];
    [self.view addSubview:switchBtn];
    [switchBtn addTarget:self action:@selector(switchBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [switchBtn BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:_imageView parentRelation:NO distance:20 center:YES];
}

- (void)switchBtnEvent
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0;
    transition.type = kCATransitionFade;
    
    [_imageView.layer addAnimation:transition forKey:nil];
    
    UIImage *currentImage = _imageView.image;
    NSUInteger index = [_images indexOfObject:currentImage];
    index = (index + 1) % [_images count];
    _imageView.image = _images[index];
}

@end
