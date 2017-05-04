//
//  CAEmitterLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/4.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CAEmitterLayerTestVC.h"

@interface CAEmitterLayerTestVC ()
{
    UIView *_containerView;
}
@end

@implementation CAEmitterLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor blackColor];
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_containerView];
    [_containerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = _containerView.bounds;
    [_containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0,
                                          emitter.frame.size.height / 2.0);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"drop"].CGImage;
    cell.birthRate = 50;
    cell.lifetime = 4.0;
    cell.color = UIColorFromHEX(0x8fafcc).CGColor;
    cell.alphaSpeed = -0.5;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2;
    emitter.emitterCells = @[cell];
}

@end
