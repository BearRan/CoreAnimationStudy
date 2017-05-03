//
//  CATiledLayerTestVC.m
//  CoreAnimationStudy
//
//  Created by Bear on 2017/5/3.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "CATiledLayerTestVC.h"

@interface CATiledLayerTestVC () <CALayerDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation CATiledLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.scrollView];
    [self.scrollView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.frame = CGRectMake(0, 0, 1200, 900);
    tiledLayer.delegate = self;
    [self.scrollView.layer addSublayer:tiledLayer];
    
    self.scrollView.contentSize = tiledLayer.frame.size;
    [tiledLayer setNeedsDisplay];
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    
    //  determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    
    NSLog(@"bounds:%@", NSStringFromCGRect(bounds));
    NSLog(@"x:%ld, y:%ld", x, y);
    
    //  load tile image
    NSString *imageName = [NSString stringWithFormat:@"f_%ld_%ld", (long)y, (long)x];
    UIImage *tileImage = [UIImage imageNamed:imageName];
    
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

@end
