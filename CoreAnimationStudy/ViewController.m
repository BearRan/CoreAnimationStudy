//
//  ViewController.m
//  CoreAnimationStudy
//
//  Created by apple on 16/11/15.
//  Copyright © 2016年 Bear. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_mainTableView;
    NSArray     *_dataVCArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self demo1_contents];
    
    [self dataArray];
    [self createUI];
}

- (void)dataArray
{
    _dataVCArray = @[
//                     @"ContentImageViewController",
//                     @"AnchorPointEXVC",
//                     @"ZPositionViewController",
//                     @"HitTestViewController",
//                     @"BorderViewController",
//                     @"ShadowTestVC",
//                     @"ShadowPathTestVC",
//                     @"MaskLayerTestVC",
//                     @"FilterTestVC",
//                     @"GroupOpacityVC",
                     
                     //Chapter4
                     @"CAAffineTransformVC",
                     @"ComplexTransformViewController",
                     @"CGAffineTransformShearTestVC",
                     @"CATrasnform3DTestVC",
                     @"CATrasnform3DTest2VC",
                     @"CATransform3DTest3VC",
                     
//                     @"CAReplicatorLayerTestVC",
//                     @"ReflectionTestVC",
                     ];
}

- (void)createUI
{
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataVCArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = _dataVCArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcName = _dataVCArray[indexPath.row];
    UIViewController *destinationVC = [[NSClassFromString(vcName) alloc] init];
    [self.navigationController pushViewController:destinationVC animated:YES];
}


- (void)demo1_contents
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 200, 200);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    layer.masksToBounds = YES;
    
    
    UIImage *image = [UIImage imageNamed:@"image1"];
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    layer.contentsGravity = kCAGravityCenter;
    layer.contentsScale = [UIScreen mainScreen].scale;
    
    
    [self.view.layer addSublayer:layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
