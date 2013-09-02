//
//  TMDViewController.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 8/26/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDViewController.h"
#import "TMDLayerAnimation.h"

#import "TMDStoryTestVC.h"

@interface TMDViewController ()

@end

@implementation TMDViewController
{
    CALayer *_layer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
    [self testAnimation];
}


-(void)testAnimation
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [TMDLayerAnimation pulse:view.layer];
    [self.view addSubview:view];
    
    
    
    [CATransaction setDisableActions:NO];
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = CGPointMake(160, 250);
    _layer.backgroundColor = [UIColor blackColor].CGColor;
    _layer.borderColor = [UIColor redColor].CGColor;
    _layer.opacity = 1.0f;
    
    [self.view.layer addSublayer:_layer];
    [self performSelector:@selector(testImplicitLayerAnimation) withObject:nil afterDelay:1];
    
}

-(void)testImplicitLayerAnimation
{
   // _layer.position = CGPointMake(100, 200);
    _layer.opacity = .2f;
}

-(IBAction)startStoryAction:(id)sender
{
    TMDStoryTestVC *vc = [TMDStoryTestVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
