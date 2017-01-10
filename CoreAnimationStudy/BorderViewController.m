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
    [view1 BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 150, 150)];
    view2.backgroundColor = [UIColor redColor];
    view2.layer.cornerRadius = 20;
    [view1 addSubview:view2];
}

- (void)createTestImageView
{
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    view3.layer.contents = 
//    [self.view addSubview:view3];
}

@end
