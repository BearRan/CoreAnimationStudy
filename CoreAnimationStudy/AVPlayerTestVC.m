//
//  AVPlayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/8.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "AVPlayerTestVC.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerTestVC ()
{
    UIView *_containerView;
}

@end

@implementation AVPlayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _containerView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_containerView];
    [_containerView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    NSString *testURLStr = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    NSString *testURLStrLocal = @"TestMov";
    NSURL *url = [[NSBundle mainBundle] URLForResource:testURLStrLocal
                                         withExtension:@"mp4"];
    
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    playerLayer.frame = _containerView.bounds;
    [_containerView.layer addSublayer:playerLayer];
    
    [self transformWithLayer:playerLayer];
    
    [player play];
}

- (void)transformWithLayer:(AVPlayerLayer *)playerLayer
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m31 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
    playerLayer.transform = transform;
    
    playerLayer.masksToBounds = YES;
    playerLayer.cornerRadius = 20.0;
    playerLayer.borderColor = [UIColor brownColor].CGColor;
    playerLayer.borderWidth = 5.0;
}

@end
