//
//  PresentationLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/9.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "PresentationLayerTestVC.h"

@interface PresentationLayerTestVC ()

@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation PresentationLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.width / 2.0, self.view.height / 2.0);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        UIColor *randomColor = [BearConstants randomColor];
        self.colorLayer.backgroundColor = randomColor.CGColor;
    }else{
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

@end
