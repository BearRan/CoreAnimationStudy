//
//  CGAffineTransformShearTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CGAffineTransformShearTestVC.h"

@interface CGAffineTransformShearTestVC ()

@end

@implementation CGAffineTransformShearTestVC

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:imageView];
    [imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    imageView.layer.affineTransform = CGAffineTransformMakeShear(1, 0);
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
