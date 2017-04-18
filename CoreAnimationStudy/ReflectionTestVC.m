//
//  ReflectionTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/18.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ReflectionTestVC.h"
#import "ReflectionView.h"

@interface ReflectionTestVC ()

@end

@implementation ReflectionTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ReflectionView *reflectionView = [[ReflectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:reflectionView];
    [reflectionView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    UIImage *testImage2 = [UIImage imageNamed:@"image2"];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(-150, 0, 100, 100)];
    imageView2.image = testImage2;
    [reflectionView addSubview:imageView2];
    
    UIImage *testImage = [UIImage imageNamed:@"image2"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.image = testImage;
    [reflectionView addSubview:imageView];
    
    [UIView animateWithDuration:2.0 animations:^{
        [imageView setX:50];
    }];
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
