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

#import "TMDStoryView.h"

@interface TMDViewController ()
@property (weak, nonatomic) IBOutlet TMDStoryView *viewStory;


@end

@implementation TMDViewController
{
    CALayer         *_layer;
    //TMDStoryView    *_storyView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startStoryAction:)];
    //[self.view addGestureRecognizer:tap];
	
    //[self testAnimation];
    [self setLayout];
    [self createStory];
}

-(void)setLayout
{
    float screenRatio = [UIScreen mainScreen].bounds.size.width / [UIScreen mainScreen].bounds.size.height;
    if (screenRatio < 1.f)
    {
        screenRatio = 1.f / screenRatio;
    }
    
    CGFloat ratio = screenRatio;
    NSLayoutConstraint *constraint = [NSLayoutConstraint
                                      constraintWithItem:_viewStory
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:_viewStory
                                      attribute:NSLayoutAttributeHeight
                                      multiplier:ratio
                                      constant:0];
    constraint.priority = 1000;
    [_viewStory addConstraint:constraint];
}

-(void)createStory
{
    TMDStory *story = [TMDStory new];
    story.title = @"Test Story";
    story.userName = @"TMD";
    
    for (int i = 1; i <= 10; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [story.pictures addObject:image];
    }
    
    //_viewStory = [[TMDStoryView alloc] initWithFrame:[self frameScreen]];
    [_viewStory setStory:story];
    [_viewStory play];
    //[self.view addSubview:_viewStory];
}

-(CGRect)frameScreen
{
    return CGRectMake(0, 120, 320, 240);
}

-(void)testAnimation
{
    
    //[self randomAnimationWithImage:image];
    
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

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}

@end
