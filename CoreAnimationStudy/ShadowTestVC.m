//
//  ShadowTestVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/10.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ShadowTestVC.h"

@interface ShadowTestVC ()

@end

@implementation ShadowTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ShadowTestVC";
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
//    view1.layer.masksToBounds = YES;
    [self.view addSubview:view1];
    [view1 BearSetRelativeLayoutWithDirection:kDIR_UP destinationView:nil parentRelation:YES distance:100 center:YES];
    
    view1.layer.shadowOpacity = 1;
    view1.layer.shadowColor = [UIColor purpleColor].CGColor;
    view1.layer.shadowOffset = CGSizeMake(8, 8);
    view1.layer.shadowRadius = 10;
}

- (void)createTestImageView
{
    UIImage *image = [UIImage imageNamed:@"testImage_Clock"];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    view3.backgroundColor = [UIColor orangeColor];
    view3.layer.contents = (__bridge id)image.CGImage;
    view3.layer.contentsGravity = kCAGravityCenter;
    view3.layer.contentsScale = 1.0;
    [self.view addSubview:view3];
    [view3 BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:100 center:YES];
    
    view3.layer.borderWidth = 5.0;
    
    view3.layer.shadowOpacity = 1;
    view3.layer.shadowColor = [UIColor blackColor].CGColor;
    view3.layer.shadowOffset = CGSizeMake(13, 13);
    view3.layer.shadowRadius = 3;
}

@end
