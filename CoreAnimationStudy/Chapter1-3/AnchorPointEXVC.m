//
//  AnchorPointEXVC.m
//  CoreAnimationStudy
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import "AnchorPointEXVC.h"

@interface AnchorPointEXVC ()

@end

@implementation AnchorPointEXVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"AnchorPoint";
    
    [self createUI];
}

- (void)createUI
{
    UIView *viewA = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
    viewA.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:viewA];
    [viewA BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
    viewB.backgroundColor = [UIColor blueColor];
    viewB.layer.anchorPoint = CGPointMake(-0.5, -0.5);
    [self.view addSubview:viewB];
    [viewB BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    NSLog(@"--viewA frame:%@", NSStringFromCGRect(viewA.frame));
    NSLog(@"--viewB frame:%@", NSStringFromCGRect(viewB.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
