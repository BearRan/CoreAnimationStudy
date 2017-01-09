//
//  HitTestViewController.m
//  CoreAnimationStudy
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import "HitTestViewController.h"

@interface HitTestViewController ()
{
    UIView  *_layerContainerView;
    CALayer *_blueLayer;
}
@end

@implementation HitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HitTestViewController";
    
    [self createUI];
}

- (void)createUI
{
    _layerContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, NAV_STA, 200, 200)];
    _layerContainerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_layerContainerView];
    [_layerContainerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _blueLayer = [CALayer layer];
    _blueLayer.frame = CGRectMake(50, 50, 100, 100);
    _blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [_layerContainerView.layer addSublayer:_blueLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    NSLog(@"--point:%@", NSStringFromCGPoint(point));
    point = [_layerContainerView.layer convertPoint:point fromLayer:self.view.layer];
    NSLog(@"--point2:%@", NSStringFromCGPoint(point));
    
    if ([_layerContainerView.layer containsPoint:point]) {
        
        point = [_blueLayer convertPoint:point fromLayer:_layerContainerView.layer];
        NSLog(@"--point3:%@", NSStringFromCGPoint(point));
        if ([_blueLayer containsPoint:point]) {
            NSLog(@"--inside");
        }else{
            NSLog(@"--outSide");
        }
    }
    
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
