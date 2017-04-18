//
//  ComplexTransformViewController.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/18.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ComplexTransformViewController.h"

@interface ComplexTransformViewController ()

@end

@implementation ComplexTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeComplexTransform];
}

- (void)makeComplexTransform
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:imageView];
    [imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    transform = CGAffineTransformTranslate(transform, 200, 0);
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30);
    imageView.layer.affineTransform = transform;
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
