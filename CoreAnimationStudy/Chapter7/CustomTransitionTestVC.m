//
//  CustomTransitionTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/15.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CustomTransitionTestVC.h"

@interface CustomTransitionTestVC ()

@end

@implementation CustomTransitionTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"perform aniamtion" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    [btn addTarget:self action:@selector(performAnimation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)performAnimation
{
    //preserve the current view snapshot
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //insert snapshot view in front of this one
    UIImageView *coverView = [[UIImageView alloc] initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    [self.view addSubview:coverView];
    
    //update the view (we'll simply randomize the layer background color)
    self.view.backgroundColor = [BearConstants randomColor];
    
    //perform animation
    [UIView animateWithDuration:1 animations:^{
        
        //scale, rotate and fade the view
        CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        coverView.transform = transform;
        coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [coverView removeFromSuperview];
    }];
}

@end
