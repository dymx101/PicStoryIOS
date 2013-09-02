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
#import "FTAnimation.h"
#import "FTAnimationManager.h"

@interface TMDViewController ()

@end

@implementation TMDViewController
{
    CALayer *_layer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startStoryAction:)];
    //[self.view addGestureRecognizer:tap];
	
    [self testAnimation];
}

-(CGRect)frameScreen
{
    return CGRectMake(0, 120, 320, 240);
}

-(CGRect)frameLeftHide
{
    return CGRectMake(-320, 120, 320, 240);
}

-(CGRect)frameRightHide
{
    return CGRectMake(320, 120, 320, 240);
}

-(CGRect)frameTopHide
{
    return CGRectMake(0, -240, 320, 240);
}

-(CGRect)frameBottomHide
{
    return CGRectMake(0, 240, 320, 240);
}

-(CGRect)frameZoomOut
{
    return CGRectMake(-160, 0, 640, 480);
}

-(CGRect)frameZoomIn
{
    return CGRectMake(160, 240, 0, 0);
}

-(CGRect)frameRandom
{
    int i = arc4random() % 8;
    switch (i)
    {
        case 0:
            return [self frameLeftHide];
            
        case 1:
            return [self frameTopHide];
            
        case 2:
            return [self frameRightHide];
            
        case 3:
            return [self frameBottomHide];
            
        case 4:
        case 5:
            return [self frameZoomOut];
            
        case 6:
        case 7:
            return [self frameZoomIn];
            
        default:
            break;
    }
    
    return [self frameScreen];
}

-(void)randomMoveAnimationWithImage:(UIImage *)aImage
{
    if (aImage)
    {
        UIView *view = [[UIView alloc] initWithFrame:[self frameRandom]];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:aImage];
        iv.frame = view.bounds;
        iv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [view addSubview:iv];
        
        [self.view addSubview:view];
        
        [UIView animateWithDuration:.2f animations:^{
            view.frame = [self frameScreen];
        } completion:^(BOOL finished) {
            [self performSelector:@selector(testAnimation) withObject:nil afterDelay:2];
        }];
    }
}

-(void)randomAlphaAnimationWithImage:(UIImage *)aImage
{
    if (aImage)
    {
        UIView *view = [[UIView alloc] initWithFrame:[self frameScreen]];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:aImage];
        iv.frame = view.bounds;
        iv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [view addSubview:iv];
        
        [self.view addSubview:view];
        
        view.alpha = 0.f;
        [UIView animateWithDuration:.2f animations:^{
            view.alpha = 1;
        } completion:^(BOOL finished) {
            [self performSelector:@selector(testAnimation) withObject:nil afterDelay:2];
        }];
    }
}

-(void)randomAnimationWithImage:(UIImage *)aImage
{
    int rnd = arc4random() % 3;
    switch (rnd)
    {
        case 0:
        case 1:
            [self randomMoveAnimationWithImage:aImage];
            break;
            
        case 2:
            [self randomAlphaAnimationWithImage:aImage];
            break;
            
        default:
            break;
    }
}

-(void)testAnimation
{
    static int num = 1;
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg", num];
    UIImage *image = [UIImage imageNamed:imageName];
    num++;
    if (num > 10)
    {
        num = 1;
    }
    
    [self randomAnimationWithImage:image];
    
    //[TMDLayerAnimation pulse:view.layer];
    
    
    //[view slideInFrom:kFTAnimationBottom duration:.33f delegate:self];
    
//    CAAnimation *anim = [[FTAnimationManager sharedManager] slideInAnimationFor:view direction:kFTAnimationBottom duration:.33f delegate:self startSelector:NULL stopSelector:NULL];
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [view.layer addAnimation:anim forKey:@"MySpecialAnimation"];
    
    /////////////////////////
    
    
    //////////////////////
    
    //[CATransaction setDisableActions:NO];
//    _layer = [CALayer layer];
//    
//    _layer.bounds = CGRectMake(0, 0, 300, 200);
//    _layer.position = CGPointMake(160, 250);
//    _layer.backgroundColor = [UIColor blueColor].CGColor;
//    _layer.borderColor = [UIColor redColor].CGColor;
//    _layer.opacity = 1.0f;
//    
//    [self.view.layer addSublayer:_layer];
//    [self performSelector:@selector(testImplicitLayerAnimation) withObject:nil afterDelay:1];
    
}

-(CALayer *)createLayerWithRect:(CGRect)aRect
{
    CALayer *layer = [CALayer layer];
    
    layer.bounds = aRect;
    layer.position = CGPointMake(0, 0);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.borderColor = [UIColor redColor].CGColor;
    layer.opacity = 1.0f;
    
    return layer;
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
    _layer.opacity = .2f;
}

-(IBAction)startStoryAction:(id)sender
{
    [self testAnimation];
    //TMDStoryTestVC *vc = [TMDStoryTestVC new];
    //[self presentViewController:vc animated:YES completion:nil];
}

@end
