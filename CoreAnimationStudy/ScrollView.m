//
//  ScrollView.m
//  CoreAnimationStudy
//
//  Created by Bear on 17/4/28.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.layer.masksToBounds = YES;
    
    UIPanGestureRecognizer *panGR = nil;
    panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGR];
}

- (void)pan:(UIPanGestureRecognizer *)panGR
{
    
    CGPoint offSet = self.bounds.origin;
    offSet.x -= [panGR translationInView:self].x;
    offSet.y -= [panGR translationInView:self].y;
    
    [(CAScrollLayer *)self.layer scrollToPoint:offSet];
    [panGR setTranslation:CGPointZero inView:self];
    
    NSLog(@"offSet:%@", NSStringFromCGPoint(offSet));
}

@end
