//
//  CAScrolLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/28.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CAScrolLayerTestVC.h"
#import "ScrollView.h"

@interface CAScrolLayerTestVC ()

@end

@implementation CAScrolLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    ScrollView *scrollView = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    [scrollView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIImage *image = [UIImage imageNamed:@"image2"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.image = image;
    [scrollView addSubview:imageView];
    [imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
//    scrollView.layer.contents = (__bridge id)image.CGImage;
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
