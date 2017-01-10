//
//  ContentImageViewController.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ContentImageViewController.h"

@interface ContentImageViewController ()

@end

@implementation ContentImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ContentImageViewController";
    [self createUI];
}

- (void)createUI
{
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:layerView];
    [layerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIImage *image = [UIImage imageNamed:@"testImage_Clock"];
    layerView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    layerView.layer.contents = (__bridge id)image.CGImage;
    
    
    //  contentsGravity拉伸效果
    layerView.layer.contentsGravity = kCAGravityCenter;
    
    //  layerView.layer.contentsGravity == layerView.contentMode
    //  layerView.contentMode = UIViewContentModeCenter;
    
    
    //  contentsScale缩放
    layerView.layer.contentsScale = [UIScreen mainScreen].scale;
}

@end
