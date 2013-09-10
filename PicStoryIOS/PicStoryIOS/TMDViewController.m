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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];

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
    
    [story.pictures addObject:[NSNull null]];
    for (int i = 1; i <= 10; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [story.pictures addObject:image];
    }
    //[story.pictures addObject:[NSNull null]];
    
    [_viewStory setStory:story];
    [_viewStory play];
}

@end
