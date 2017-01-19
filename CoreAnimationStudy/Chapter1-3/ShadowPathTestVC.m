//
//  ShadowPathTestVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ShadowPathTestVC.h"

@interface ShadowPathTestVC ()
{
    UIView *view3, *view4;
}

@end

@implementation ShadowPathTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ShadowPathTestVC";
    [self createUI];
}

- (void)createUI
{
    [self createView3];
    [self createView4];
    
    [UIView BearAutoLayViewArray:(NSMutableArray *)@[view3, view4] layoutAxis:kLAYOUT_AXIS_X center:YES];
    
    CGFloat scale = [UIScreen mainScreen].scale;
    NSLog(@"scale:%f", scale);
}

- (void)createView3
{
    UIImage *image = [UIImage imageNamed:@"testImage_Clock"];
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view3.layer.contents = (__bridge id)image.CGImage;
    view3.layer.contentsGravity = kCAGravityCenter;
    view3.layer.contentsScale = 1.0;
    view3.layer.contentsScale = [UIScreen mainScreen].scale;
    [self.view addSubview:view3];
    
    view3.layer.shadowOpacity = 0.5;
    
    //  create a square shadow
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, view3.bounds);
    view3.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
}

- (void)createView4
{
    UIImage *image = [UIImage imageNamed:@"testImage_Clock"];
    
    view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view4.layer.contents = (__bridge id)image.CGImage;
    view4.layer.contentsGravity = kCAGravityCenter;
    view4.layer.contentsScale = 1.0;
    view4.layer.contentsScale = [UIScreen mainScreen].scale;
    [self.view addSubview:view4];
    
    view4.layer.shadowOpacity = 0.5;
    
    //  create a circular shadow
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, view4.bounds);
    view4.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
}

@end
