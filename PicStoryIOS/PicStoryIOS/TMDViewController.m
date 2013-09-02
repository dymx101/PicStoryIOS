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
#import "NYXImagesKit.h"

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
    
    /////////////////////////
    
    
    //////////////////////
    
    [CATransaction setDisableActions:NO];
    _layer = [CALayer layer];
    
    _layer.bounds = CGRectMake(0, 0, 300, 200);
    _layer.position = CGPointMake(160, 250);
    _layer.backgroundColor = [UIColor blueColor].CGColor;
    _layer.borderColor = [UIColor redColor].CGColor;
    _layer.opacity = 1.0f;
    
    [self.view.layer addSublayer:_layer];
    [self performSelector:@selector(testImplicitLayerAnimation) withObject:nil afterDelay:1];
    
}

-(void)testImageKit
{
    UIImage *image = [UIImage imageNamed:@"sample.jpg"];
    
    
    //UIImage* masked = [image maskWithImage:[UIImage imageNamed:@"mask.jpg"]];
    
    UIImage* cropped = [image cropToSize:(CGSize){100, 100} usingMode:NYXCropModeCenter];
    
    //UIImage *blurImg = [cropped gaussianBlurWithBias:100];
    
    //    UIImage* rotated1 = [cropped rotateInDegrees:217.0f];
    //    UIImage* rotated2 = [cropped rotateInRadians:M_PI_2];
    //    UIImage* flipped1 = [cropped verticalFlip];
    //    UIImage* flipped2 = [cropped horizontalFlip];
    
    //UIImage* reflected = [cropped reflectedImageWithHeight:cropped.size.height fromAlpha:0.0f toAlpha:0.5f];
    
    //UIImage *enhanced = [cropped autoEnhance];
    //UIImage *redeyecorrection = [cropped redEyeCorrection];
    
    _layer.contents = (id)cropped.CGImage;
}

-(void)testImplicitLayerAnimation
{
   // _layer.position = CGPointMake(100, 200);
    //_layer.opacity = .2f;
}

-(IBAction)startStoryAction:(id)sender
{
    TMDStoryTestVC *vc = [TMDStoryTestVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
