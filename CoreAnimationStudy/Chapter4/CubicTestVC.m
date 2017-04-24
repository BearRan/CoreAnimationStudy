//
//  CubicTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/21.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CubicTestVC.h"

@interface CubicTestVC ()
{
    NSMutableArray  *_facesArray;
    UIView          *_contentView;
    CGFloat         _halfWidth;
}

@end

@implementation CubicTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _halfWidth = 100;
    
    _contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_contentView];
    
    [self createSixFaces];
    [self addFaces];
}

- (void)addFaces
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    _contentView.layer.sublayerTransform = perspective;
    
    //  1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, _halfWidth);
    [self addFace:0 withTransForm:transform];
    
    //  2
    transform = CATransform3DMakeTranslation(_halfWidth, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransForm:transform];
    
    //  3
    transform = CATransform3DMakeTranslation(0, -_halfWidth, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransForm:transform];
    
    //  4
    transform = CATransform3DMakeTranslation(0, _halfWidth, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransForm:transform];
    
    //  5
    transform = CATransform3DMakeTranslation(-_halfWidth, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransForm:transform];
    
    //  6
    transform = CATransform3DMakeTranslation(0, 0, -_halfWidth);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransForm:transform];
}

- (void)createSixFaces
{
    _facesArray = [NSMutableArray new];
    
    for (int i = 0; i < 6; i++) {
        UIView *faceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2 * _halfWidth, 2 * _halfWidth)];
        faceView.backgroundColor = [self randomColor];
        
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%d", i + 1];
        label.textColor = [self randomColor];
        label.font = [UIFont systemFontOfSize:45];
        [label sizeToFit];
        [faceView addSubview:label];
        [label BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        
        [_facesArray addObject:faceView];
    }
}

- (void)addFace:(NSInteger)index withTransForm:(CATransform3D)transform
{
    UIView *faceView = _facesArray[index];
    [_contentView addSubview:faceView];
    [faceView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    faceView.layer.transform = transform;
}

- (UIColor *)randomColor
{
    CGFloat r = arc4random() % 255 / 255.0;
    CGFloat g = arc4random() % 255 / 255.0;
    CGFloat b = arc4random() % 255 / 255.0;
    UIColor *randomColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    return randomColor;
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
