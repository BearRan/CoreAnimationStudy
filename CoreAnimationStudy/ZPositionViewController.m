//
//  ZPositionViewController.m
//  CoreAnimationStudy
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import "ZPositionViewController.h"

@interface ZPositionViewController ()

@end

@implementation ZPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ZPositionViewController";
    
    [self createUI];
}

- (void)createUI
{
    CGFloat view_width = 200;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, NAV_STA, view_width, view_width)];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, NAV_STA + 100, view_width, view_width)];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    view1.layer.zPosition = 0.1f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
