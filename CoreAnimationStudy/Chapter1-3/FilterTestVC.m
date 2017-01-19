//
//  FilterTestVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "FilterTestVC.h"

@interface FilterTestVC ()

@end

@implementation FilterTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FilterTestVC";
    
    [self createUI];
}

- (void)createUI
{
    UIImage *testImage = [UIImage imageNamed:@"testImage_Clock"];
    
    UIView *imageLayerView_2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageLayerView_2.layer.contents = (__bridge id)testImage.CGImage;
    imageLayerView_2.layer.contentsGravity = kCAGravityResizeAspect;
    imageLayerView_2.layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:imageLayerView_2];
    
    UIView *imageLayerView_1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageLayerView_1.layer.contents = (__bridge id)testImage.CGImage;
    imageLayerView_1.layer.contentsGravity = kCAGravityResizeAspect;
    imageLayerView_1.layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view addSubview:imageLayerView_1];
    
    [UIView BearAutoLayViewArray:(NSMutableArray *)@[imageLayerView_2, imageLayerView_1] layoutAxis:kLAYOUT_AXIS_Y center:YES gapDistance:30];
    
    imageLayerView_1.layer.magnificationFilter = kCAFilterNearest;
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
