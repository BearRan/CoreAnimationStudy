//
//  CubicTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/21.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CubicTestVC.h"
#import <QuartzCore/QuartzCore.h>
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5

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
//    _contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_contentView];
    
    [self createSixFaces];
    [self addFaces];
}

#pragma mark - SixFaces
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
        faceView.tag = i;
        
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%d", i + 1];
        label.textColor = [self randomColor];
        label.font = [UIFont systemFontOfSize:45];
        [label sizeToFit];
        [faceView addSubview:label];
        [label BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        
        [_facesArray addObject:faceView];
        
        UIButton *faceBtn = [[UIButton alloc] initWithFrame:faceView.bounds];
        faceBtn.tag = i;
        [faceBtn addTarget:self action:@selector(clickBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
        [faceView addSubview:faceBtn];
        
        if (i == 4 ||
            i == 5 ||
            i == 6) {
            faceBtn.userInteractionEnabled = NO;
        }
    }
}

- (void)clickBtnEvent:(UIButton *)sender
{
    NSLog(@"--tap:%ld", (long)sender.tag);
}

- (void)addFace:(NSInteger)index withTransForm:(CATransform3D)transform
{
    UIView *faceView = _facesArray[index];
    [_contentView addSubview:faceView];
    [faceView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    faceView.layer.transform = transform;
    
//    [self applyingLightingToFace:faceView.layer];
}

- (UIColor *)randomColor
{
    return [BearConstants randomColor];
}

#pragma mark - Light And Shadow

- (void)applyingLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    
    //convert the face transform to matrix
    //(GLKMatrix has the same structure as CATransform3D)
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    
    //get got product with light dirction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

@end
