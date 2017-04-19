//
//  CATrasnform3DTest2VC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CATrasnform3DTest2VC.h"

@interface CATrasnform3DTest2VC ()
{
    NSMutableArray *_imageViewsArr;
}
@end

@implementation CATrasnform3DTest2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createImageViewsArr];
}

- (void)createImageViewsArr
{
    _imageViewsArr = [NSMutableArray new];
    
    for (int i = 0; i < 4; i++) {
        UIImageView *_imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
        _imageView.frame = CGRectMake(0, 0, 160, 160);
        [self.view addSubview:_imageView];
        [_imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        
        kDIRECTION dir;
        if (i == 0) {
            dir = kDIR_UP;
        }else if (i == 1) {
            dir = kDIR_LEFT;
        }else if (i == 2) {
            dir = kDIR_DOWN;
        }else if (i == 3) {
            dir = kDIR_RIGHT;
        }
        
        [_imageViewsArr addObject:_imageView];
        [self makeTransform3DWithDir:dir withImageView:_imageView];
    }
}

- (void)makeTransform3DWithDir:(kDIRECTION)Dir withImageView:(UIImageView *)imageView
{
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = - 1.0 / 500;
    CGFloat rotate = M_PI / 180.0 * 70;
    CGFloat moveDis = 130;
    
    switch (Dir) {
        case kDIR_UP:
        {
            transform3D = CATransform3DTranslate(transform3D, 0, -moveDis, 0);
            transform3D = CATransform3DRotate(transform3D, -rotate, 1, 0, 0);
        }
            break;
            
        case kDIR_LEFT:
        {
            transform3D = CATransform3DTranslate(transform3D, -moveDis, 0, 0);
            transform3D = CATransform3DRotate(transform3D, rotate, 0, 1, 0);
        }
            break;
            
            
        case kDIR_DOWN:
        {
            transform3D = CATransform3DTranslate(transform3D, 0, moveDis, 0);
            transform3D = CATransform3DRotate(transform3D, rotate, 1, 0, 0);
        }
            break;
            
        case kDIR_RIGHT:
        {
            transform3D = CATransform3DTranslate(transform3D, moveDis, 0, 0);
            transform3D = CATransform3DRotate(transform3D, -rotate, 0, 1, 0);
        }
            break;
            
        default:
            break;
    }
    
    imageView.layer.transform = transform3D;
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
