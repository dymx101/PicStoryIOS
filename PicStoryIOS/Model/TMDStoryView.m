//
//  TMDStoryView.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/9/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDStoryView.h"
#import "TMDMovie.h"

@interface TMDStoryView () <TMDMovieDelegate>

@end

@implementation TMDStoryView
{
    TMDStory    *_story;
    TMDMovie    *_movie;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit
{
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
}


-(void)setStory:(TMDStory *)aStory
{
    _story = aStory;
    _movie = [[TMDMovie alloc] initWithStory:_story delegate:self];
    _movie.delegate = self;
}

-(void)play
{
    [_movie play];
}

#pragma mark -
-(CGRect)movieRect
{
    return self.bounds;
}

-(void)addLayer:(CALayer *)aLayer
{
    [self.layer addSublayer:aLayer];
}

@end
