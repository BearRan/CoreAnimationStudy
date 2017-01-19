//
//  BorderViewController.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "BorderViewController.h"

@interface BorderViewController ()

@end

@implementation BorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BorderViewController";
    [self createUI];
    [self createTestImageView];
}

- (void)createUI
{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view1.backgroundColor = [UIColor grayColor];
    view1.layer.cornerRadius = 20;
    view1.layer.borderWidth = 5;
    view1.layer.borderColor = [UIColor blackColor].CGColor;
    view1.layer.masksToBounds = YES;
    [self.view addSubview:view1];
    [view1 BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:nil parentRelation:YES distance:100 center:YES];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 150, 150)];
    view2.backgroundColor = [UIColor redColor];
    view2.layer.cornerRadius = 20;
    [view1 addSubview:view2];
}

- (void)createTestImageView
{
    UIImage *image = [UIImage imageNamed:@"testImage_Clock"];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view3.backgroundColor = [UIColor orangeColor];
    view3.layer.contents = (__bridge id)image.CGImage;
    view3.layer.contentsGravity = kCAGravityCenter;
    view3.layer.contentsScale = 1.0;
    [self.view addSubview:view3];
    [view3 BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:100 center:YES];
    
    view3.layer.borderWidth = 5.0;
}

@end
