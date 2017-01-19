//
//  GroupOpacityVC.m
//  CoreAnimationStudy
//
//  Created by apple on 17/1/19.
//  Copyright © 2017年 Bear. All rights reserved.
//

#import "GroupOpacityVC.h"

@interface GroupOpacityVC ()
{
    UIView *_testContentView1;
    UIView *_testContentView2;
    UIView *_testContentView3;
}

@end

@implementation GroupOpacityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GroupOpacityVC";
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = UIColorFromHEX(0x9999cc);
    
    [self createTestContentView1];
    [self createTestContentView2];
    [self createTestContentView3];
    
    [UIView BearAutoLayViewArray:(NSMutableArray *)@[_testContentView1, _testContentView2, _testContentView3] layoutAxis:kLAYOUT_AXIS_Y center:YES gapDistance:20];
}

- (void)createTestContentView1
{
    _testContentView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _testContentView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_testContentView1];
    
    UILabel *label1 = [UILabel new];
    label1.text = @"Hello Bear";
    [label1 sizeToFit];
    [_testContentView1 addSubview:label1];
    [label1 BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)createTestContentView2
{
    _testContentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _testContentView2.backgroundColor = [UIColor whiteColor];
    _testContentView2.alpha = 0.2;
    [self.view addSubview:_testContentView2];
    
    UILabel *label2 = [UILabel new];
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = @"Hello Bear";
    [label2 sizeToFit];
    [_testContentView2 addSubview:label2];
    [label2 BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)createTestContentView3
{
    _testContentView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _testContentView3.backgroundColor = [UIColor whiteColor];
    _testContentView3.alpha = 0.2;
    [self.view addSubview:_testContentView3];
    
    UILabel *label3 = [UILabel new];
    label3.backgroundColor = [UIColor orangeColor];
    label3.text = @"Hello Bear";
    label3.alpha = 0.7;
    [label3 sizeToFit];
    [_testContentView3 addSubview:label3];
    [label3 BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    _testContentView3.layer.shouldRasterize = YES;
}

@end
