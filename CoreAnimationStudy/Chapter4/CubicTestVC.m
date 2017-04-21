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
    NSMutableArray *_facesArray;
}

@end

@implementation CubicTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSixFaces];
}

- (void)createSixFaces
{
    _facesArray = [NSMutableArray new];
    
    for (int i = 0; i < 6; i++) {
        UIView *faceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        faceView.backgroundColor = [self randomColor];
        [self.view addSubview:faceView];
        [faceView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%d", i + 1];
        label.textColor = [self randomColor];
        label.font = [UIFont systemFontOfSize:25];
        [label sizeToFit];
        [faceView addSubview:label];
        [label BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
        
        [_facesArray addObject:faceView];
    }
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
